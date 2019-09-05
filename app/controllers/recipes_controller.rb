class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort]
      @recipes = Recipe.sort_by_num_ingredients
    else
      @recipes = Recipe.all
    end
  end

  def new
    @recipe = Recipe.new
    @users = User.all
  end

  def create
    @recipe = Recipe.create(recipe_params(:name, :user_id))
    if @recipe.valid?
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

  def show

  end

  def edit
    @users = User.all
  end

  def update
    if @recipe.update(recipe_params(:name))
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end

end
