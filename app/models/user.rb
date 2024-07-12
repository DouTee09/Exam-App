class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { email.downcase! }

  has_many :subjects, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :email, length: { maximum: 255 }
end
