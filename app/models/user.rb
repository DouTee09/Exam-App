class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_initialize :set_default_role, :set_default_active, if: :new_record?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { email.downcase! }

  has_many :subjects, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :email, length: { maximum: 255 }

  def activate_account!
    update_attribute :active, true
  end

  def deactivate_account!
    update_attribute :active, false
  end

  private

  def set_default_role
    self.role ||= 0
  end

  def set_default_active
    self.active ||= true
  end

end
