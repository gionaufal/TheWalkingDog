class Walker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :age, :address, :cpf, :bio, :experience, :price, :email,
            :phone, :region, presence: true
  has_many :proposal
  has_many :users, through: :proposal
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                     default_url: 'assets/images/dog.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
