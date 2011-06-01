class VoteOption < ActiveRecord::Base
  has_and_belongs_to :codes

  validates_presence_of :option
  validates_association_of :codes
end
