json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nome_fantasia, :email, :cnpj
  json.url cliente_url(cliente, format: :json)
end
