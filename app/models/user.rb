class User < ApplicationRecord
  has_many :subjects, dependent: :destroy
  has_many :answers, dependent: :destroy
  before_save { email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: true
  validates :password, length: { minimum: 6 },  allow_nil: true

  has_secure_password

  devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 13

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
