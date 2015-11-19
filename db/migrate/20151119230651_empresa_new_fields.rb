class EmpresaNewFields < ActiveRecord::Migration
  def change
    add_column :empresas, :cnpj, :string
    add_column :empresas, :razao_soc, :string
    rename_column :empresas, :name, :nome_fantasia
  end
end
