require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:carlos)
    @empresa = @user.empresas.build(nome_fantasia: 'Loja')
    @user.active_empresa = @empresa.id
    @user.save
    @collection = @empresa.collections.build(name: 'verao')
  end
  
  test "should be valid" do
    assert @collection.valid?
  end
  
  test "empresa id should be present" do
    @collection.empresa_id = nil
    assert_not @collection.valid?
  end
  
  test "name should be present" do
    @collection.name = "   "
    assert_not @collection.valid?
  end
  
  test "name be at most 140 characters" do
    @collection.name = "a" * 141
    assert_not @collection.valid?
  end
  
  test "associated items should be destroyed" do
    @collection.save
    @collection.items.create!(name: "Blusa", referencia: "100")
    assert_difference 'Item.count', -1 do
      @collection.destroy
    end
  end
end
