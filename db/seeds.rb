# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
Allergy.destroy_all

matt = User.create(name: "Matt", age: 27)
sam = User.create(name: "Sam", age: 26)

m_cp = Recipe.create(name: "Chick Parm", user: matt)
m_cc = Recipe.create(name: "Chick Ceez", user: matt)
s_fb = Recipe.create(name: "Fajita Bowl", user: sam)

cheese = Ingredient.create(name: "Cheese", nutrition_value: 2)
chicken = Ingredient.create(name: "Chicken", nutrition_value: 7)
rice = Ingredient.create(name: "Rice", nutrition_value: 5)
pasta = Ingredient.create(name: "Pasta", nutrition_value: 4)
peppers = Ingredient.create(name: "Peppers", nutrition_value: 8)
sauce = Ingredient.create(name: "Pasta Sauce", nutrition_value: 6)
salsa = Ingredient.create(name: "Salsa", nutrition_value: 6)
lettuce = Ingredient.create(name: "Lettuce", nutrition_value: 7)

RecipeIngredient.create(recipe: m_cp, ingredient: pasta)
RecipeIngredient.create(recipe: m_cp, ingredient: chicken)
RecipeIngredient.create(recipe: m_cp, ingredient: cheese)
RecipeIngredient.create(recipe: m_cp, ingredient: sauce)
RecipeIngredient.create(recipe: m_cc, ingredient: chicken)
RecipeIngredient.create(recipe: m_cc, ingredient: lettuce)
RecipeIngredient.create(recipe: m_cc, ingredient: cheese)
RecipeIngredient.create(recipe: s_fb, ingredient: rice)
RecipeIngredient.create(recipe: s_fb, ingredient: peppers)
RecipeIngredient.create(recipe: s_fb, ingredient: chicken)
RecipeIngredient.create(recipe: s_fb, ingredient: cheese)
RecipeIngredient.create(recipe: s_fb, ingredient: salsa)

Allergy.create(user: matt, ingredient: chicken)
Allergy.create(user: matt, ingredient: pasta)
Allergy.create(user: matt, ingredient: sauce)
Allergy.create(user: sam, ingredient: pasta)
Allergy.create(user: sam, ingredient: cheese)
