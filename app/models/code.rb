class Code < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :vote_options

  validates_presence_of :smell, :comment

  def self.get_random(language)
    if language == 'all'
      codes = all(:conditions => 'denounce < 5')
    else
      codes = all(:joins => :language, :conditions => ['languages.slug = ? and denounce < 5', language])
    end
    codes[rand(codes.size)]
  end

  def self.find_by_id_and_language(id, language)
    if language == 'all'
      find(id, :conditions => 'denounce < 5')
    else
      first(:joins => :language, :conditions => ['codes.id = ? and languages.slug = ? and denounce < 5', id, language])
    end
  end

  def get_votes_count_of(option)
    vote_options.find(:all, :conditions => "vote_option_id = #{option.id}").size
  end

  def denounce!
    increment! :denounce
  end

  def vote!(params)
    params.keys.each {|p| @vote_option = p.from(12).to_i if p.include?('vote_option')}
    vote_options << VoteOption.find(@vote_option)
  end
end