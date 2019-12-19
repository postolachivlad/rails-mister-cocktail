require 'open-uri'
require 'json'

Ingredients.delete_all

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
parsed = JSON.parse(open(ingredients_url).read)
parsed['drinks'].each do |element|
  element.each do |k, v|
    Ingredient.create!(name: v)
  end
end
