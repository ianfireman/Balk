json.array!(@collections) do |collection|
  json.extract! collection, :id, :name, :data_inicio
  json.url collection_url(collection, format: :json)
end
