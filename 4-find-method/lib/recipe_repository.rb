require 'recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    sql = "SELECT id, name, cook_time, rating FROM recipes"
    result = DatabaseConnection.exec_params(sql ,[])

    recipe_array = []

    result.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cook_time = record['cook_time']
      recipe.rating = record['rating']
      # now add this recipe to the array
      recipe_array << recipe
    end
    # return the array
    recipe_array
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    sql = "SELECT id, name, cook_time, rating FROM recipes WHERE id = $1"
    result = DatabaseConnection.exec_params(sql ,[id])

    recipe_array = []

    result.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cook_time = record['cook_time']
      recipe.rating = record['rating']
      # now add this recipe to the array
      recipe_array << recipe
    end
    # return a single object
    recipe_array[0]
  end
end