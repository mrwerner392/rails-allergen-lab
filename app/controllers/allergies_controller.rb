class AllergiesController < ApplicationController
  before_action :set_allergy, only: [:show, :edit, :update, :destroy]

  def index
    @allergies = Allergy.all
  end

  def new
    @allergy = Allergy.new
    @users = User.all
    @ingredients = Ingredient.all
  end

  def create
    @allergy = Allergy.create(allergy_params(:user_id, :ingredient_id))
    if @allergy.valid?
      redirect_to @allergy
    else
      flash[:errors] = @allergy.errors.full_messages
      redirect_to new_allergy_path
    end
  end

  def show

  end

  def edit
    @users = User.all
    @ingredients = Ingredient.all
  end

  def update
    if @allergy.update(allergy_params(:user_id, :ingredient_id))
      redirect_to @allergy
    else
      flash[:errors] = @allergy.errors.full_messages
      redirect_to edit_allergy_path(@allergy)
    end
  end

  def destroy
    @allergy.destroy
    redirect_to allergies_path
  end

  private

  def set_allergy
    @allergy = Allergy.find(params[:id])
  end

  def allergy_params(*args)
    params.require(:allergy).permit(*args)
  end

end
