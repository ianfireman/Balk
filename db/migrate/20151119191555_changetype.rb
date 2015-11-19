class Changetype < ActiveRecord::Migration
  def change
    change_column :clientes, :cnpj, :string
    rename_column :clientes, :name, :nome_fantasia
    add_column :clientes, :razao_soc, :string
    add_column :clientes, :inscricao_es, :string
    add_column :clientes, :nome_comprador, :string
    add_column :clientes, :nome_banco, :string
    add_column :clientes, :agencia, :string
    add_column :clientes, :conta_corrente, :string
  end
end
