require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
 
  def setup
    @user = users(:carlos)
    @empresa = @user.empresas.build(nome_fantasia: 'Empresa')
    @empresa.save
    @cliente = @empresa.clientes.build(nome_fantasia: 'Loja')
  end

  test "should be valid" do
    assert @cliente.valid?
  end

  test "empresa id should be present" do
    @cliente.empresa_id = nil
    assert_not @cliente.valid?
  end
  
  test "nome_fantasia should be present" do
    @cliente.nome_fantasia = "   "
    assert_not @cliente.valid?
  end

  test "nome_fantasia be at most 140 characters" do
    @cliente.nome_fantasia = "a" * 141
    assert_not @cliente.valid?
  end
end
