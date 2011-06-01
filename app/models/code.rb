class Code < ActiveRecord::Base
  belongs_to :language
  belongs_to :votes
  has_and_belongs_to :vote_options

  validates_presence_of :code
  validates_association_of :language, :vote_options
end