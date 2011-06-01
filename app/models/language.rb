class Language < ActiveRecord::Base
  has_many :codes

  validates_presence_of :name
end
