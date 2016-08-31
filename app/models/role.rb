class Role < ApplicationRecord

  include BaseState

  validates :name, :rule, presence: true
  validates :name, uniqueness: true

  serialize :rule, JSON

end
