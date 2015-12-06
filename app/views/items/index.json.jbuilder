json.array!(@items) do |item|
  json.extract! item, :id, :name, :referencia, :preco_unitario, :info
  json.url item_url(item, format: :json)
end
