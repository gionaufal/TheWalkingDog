class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :walker
  validates :datetime, :dogs, :gang, :location, presence: true
  enum status: { pending: 0, approved: 1, refused: 2 }
end
