class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include BaseState

  belongs_to :role, counter_cache: true

  def is_admin?
    self.id == 1
  end

  def active_for_authentication?
    super and self.state_is_able?
  end

  def role_rule
    self.is_admin? ? Ability::ROLE_RESOURCES : (self.role ? self.role.rule : {})
  end

end
