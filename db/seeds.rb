# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient = JSON.parse(open(url).read)

ingredient["drinks"].each do |x|
  Ingredient.create(name: x["strIngredient1"])
end

new_cocktail = Cocktail.new(name: "Gin & Tonic")
new_dose = Dose.new(description: "1 shot")
new_dose.ingredient = Ingredient.find(3)
new_dose.cocktail = new_cocktail
new_dose.save
new_cocktail.save
