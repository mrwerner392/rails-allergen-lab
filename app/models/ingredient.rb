class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
  has_many :allergies, dependent: :destroy
  has_many :users, through: :allergies

  validates :name, :nutrition_value, presence: true
  validates :nutrition_value, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

  def self.sorted
    Ingredient.all.sort_by {|ingredient| ingredient.allergies.count}.reverse
  end

end
