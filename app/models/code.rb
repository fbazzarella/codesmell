class Code < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :vote_options
  validates_presence_of :smell, :comment

  def self.get_random(language)
    language == 'all' ? codes = all(:conditions => 'denounce < 5') :
      codes = all(:joins => :language, :conditions => ['languages.slug = ? and denounce < 5', language])
    codes[rand(codes.size)]
  end

  def self.find_by_id_and_language(id, language)
    language == 'all' ? find(id, :conditions => 'denounce < 5') :
      first(:joins => :language, :conditions => ['codes.id = ? and languages.slug = ? and denounce < 5', id, language])
  end

  def get_votes_count_of(option)
    vote_options.all(:conditions => ['vote_option_id = ?', option.id]).size
  end

  def denounce!
    increment! :denounce
  end

  def vote!(params)
    params.keys.each do |param| 
      return vote_options << VoteOption.find(param.from(12).to_i) if param.include?('vote_option')
    end
  end
end