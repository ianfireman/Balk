require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:carlos)
    @empresa = @user.empresas.build(nome_fantasia: 'Loja')
    @user.active_empresa = @empresa.id
    @user.save
    @collection = @empresa.collections.build(name: 'verao')
    @collection.save
    @item = @collection.items.build(name: "Blusa", referencia: "100")
  end
  
  test "should be valid" do
    assert @item.valid?
  end
  
  test "referencia should be present" do
    @item.referencia = nil
    assert_not @item.valid?
  end
  
  test "name should be present" do
    @item.name = "   "
    assert_not @item.valid?
  end
  
  test "referencia should be unique" do
    duplicate_item = @item.dup
    duplicate_item.referencia = @item.referencia
    @item.save
    assert_not duplicate_item.valid?
  end
end
