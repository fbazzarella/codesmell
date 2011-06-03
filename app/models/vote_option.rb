class VoteOption < ActiveRecord::Base
  has_and_belongs_to_many :codes
  validates_presence_of :label
end
