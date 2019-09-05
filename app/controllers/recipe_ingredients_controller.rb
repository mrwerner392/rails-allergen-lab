class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  def new
    @recipe_ingredient = RecipeIngredient.new
    @recipes = Recipe.all
    @ingredients = Ingredient.all
  end

  def create
    @recipe_ingredient = RecipeIngredient.create(recipe_ingredient_params(:recipe_id, :ingredient_id))
    if @recipe_ingredient.valid?
      redirect_to @recipe_ingredient
    else
      flash[:errors] = @recipe_ingredient.errors.full_messages
      redirect_to new_recipe_ingredient_path
    end
  end

  def show

  end

  def edit
    @recipes = Recipe.all
    @ingredients = Ingredient.all
  end

  def update
    if @recipe_ingredient.update(recipe_ingredient_params(:recipe_id, :ingredient_id))
      redirect_to @recipe_ingredient
    else
      flash[:errors] = @recipe_ingredient.errors.full_messages
      redirect_to edit_recipe_ingredient_path(@recipe_ingredient)
    end
  end

  def destroy
    @recipe_ingredient.destroy
    redirect_to recipe_ingredients_path
  end

  private

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def recipe_ingredient_params(*args)
    params.require(:recipe_ingredient).permit(*args)
  end

end
