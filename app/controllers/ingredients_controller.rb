class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.sorted
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params(:name, :nutrition_value))
    if @ingredient.valid?
      redirect_to @ingredient
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to new_ingredient_path
    end
  end

  def show

  end

  def edit

  end

  def update
    if @ingredient.update(ingredient_params(:name, :nutrition_value))
      redirect_to @ingredient
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to edit_ingredient_path(@ingredient)
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params(*args)
    params.require(:ingredient).permit(*args)
  end

end
