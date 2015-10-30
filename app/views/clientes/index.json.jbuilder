json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :name, :email, :cnpj
  json.url cliente_url(cliente, format: :json)
end
