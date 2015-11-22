json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :qtd_itens, :preco_total
  json.url pedido_url(pedido, format: :json)
end
