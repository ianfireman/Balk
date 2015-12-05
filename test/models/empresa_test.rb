require 'test_helper'

class EmpresaTest < ActiveSupport::TestCase
    
  def setup
    @user = users(:carlos)
    @empresa = @user.empresas.build(nome_fantasia: 'Loja')
  end

  test "should be valid" do
    assert @empresa.valid?
  end

  test "user id should be present" do
    @empresa.user_id = nil
    assert_not @empresa.valid?
  end
  
  test "nome_fantasia should be present" do
    @empresa.nome_fantasia = "   "
    assert_not @empresa.valid?
  end

  test "nome_fantasia be at most 140 characters" do
    @empresa.nome_fantasia = "a" * 141
    assert_not @empresa.valid?
  end
  
  test "associated clientes should be destroyed" do
    @empresa.save
    @empresa.clientes.create!(nome_fantasia: "Loja")
    assert_difference 'Cliente.count', -1 do
      @empresa.destroy
    end
  end
  
  test "associated collections should be destroyed" do
    @empresa.save
    @empresa.collections.create!(name: "verao")
    assert_difference 'Collection.count', -1 do
      @empresa.destroy
    end
  end
  
end
