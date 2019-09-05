class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :name, uniqueness: {scope: :name}

  def self.sort_by_num_ingredients
    Recipe.all.sort_by {|recipe| recipe.ingredients.count}.reverse
  end

end
