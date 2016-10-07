class Walker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :age, :address, :cpf, :bio, :experience, :price, :email,
            :phone, :region, presence: true
  has_many :proposal
  has_many :users, through: :proposal
end
