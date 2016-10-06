class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :walker
  validates :datetime, :dogs, :gang, presence: true
end
