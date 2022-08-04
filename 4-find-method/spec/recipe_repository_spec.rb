require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do
    reset_recipes_table
  end

  it "return all recipes" do
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 2
    expect(recipes[0].id).to eq  '1'
    expect(recipes[0].name).to eq 'Donut'
    expect(recipes[0].cook_time).to eq '10'
    expect(recipes[0].rating).to eq '3'
    expect(recipes[1].id).to eq '2'
    expect(recipes[1].name).to eq 'Fries'
    expect(recipes[1].cook_time).to eq '20'
    expect(recipes[1].rating).to eq '5'
  end
  it "return find recipe" do
    repo = RecipeRepository.new

    recipe = repo.find(1)

    expect(recipe.id).to eq '1'
    expect(recipe.name).to eq 'Donut'
    expect(recipe.cook_time).to eq '10'
    expect(recipe.rating).to eq '3'
  end
end