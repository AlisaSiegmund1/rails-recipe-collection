class IngredientsController < ApplicationController
  def new
    @ingredient = Recipe.find(params[:recipe_id])
    @recipe = Recipe.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    recipe = Recipe.find(params[:recipe_id])
    ingredient.recipe = recipe
    ingredient.save!
    redirect_to recipe_path(recipe)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_path(@ingredient.recipe)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:description, :dose, :unit)
  end

end