class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      current_user.recipes << @recipe
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def update
    if @recipe.update_attributes(recipe_params)
      current_user.recipes << @recipe unless current_user.recipes.include? @recipe
      redirect_to @recipe, notice: 'Recipe was succcessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, 'Recipe was successfuly destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :steps, :user_id)
  end
end
