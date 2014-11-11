json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :steps
  json.url recipe_url(recipe, format: :json)
end
