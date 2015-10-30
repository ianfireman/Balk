json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :name, :email
  json.url empresa_url(empresa, format: :json)
end
