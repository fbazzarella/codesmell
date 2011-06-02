class Code < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :vote_options

  validates_presence_of :code, :comments
end