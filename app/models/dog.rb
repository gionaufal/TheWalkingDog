class Dog < ApplicationRecord
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :avatar, content_type: %r{/\Aimage\/.*\z/}
  validates :name, :age, :size, :race, :personality, presence: true
  belongs_to :user
end
