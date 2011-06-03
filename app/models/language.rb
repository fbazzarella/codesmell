class Language < ActiveRecord::Base
  has_many :codes

  validates_presence_of :name, :slug

  def self.get_name_and_slug_of(language)
    return {:name => 'Todas', :slug => 'all'} if language == 'all'
    language = find_by_slug(language)
    language ? {:name => language.name, :slug => language.slug} : nil
  end
end
