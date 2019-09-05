class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :allergies, dependent: :destroy
  has_many :ingredients, through: :allergies

  validates :name, :age, presence: true
  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0, less_than: 100}
  validate :name_is_not_user

  def name_is_not_user
    if self.name && (self.name.downcase == "user")
      self.errors[:name] << 'Name cannot be any variation of "User"'
    end
  end
end
