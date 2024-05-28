class User < ApplicationRecord
  before_save { email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
