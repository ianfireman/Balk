require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @user = users(:carlos)
    @empresa = empresas(:one)
    @collection = collections(:one)
    @item = items(:one)
    @collection.empresa_id = @empresa.id
    @collection.save
    @user.active_empresa = @empresa.id
    @user.save
    @item.collection_id = @collection.id
    @item.save
  end

  test "should get index" do
    log_in_as(users(:carlos))
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    log_in_as(users(:carlos))
    get :new, :collectionN => @collection
    assert_response :success
  end

  #test "should create item" do
  #  log_in_as(users(:carlos))
  #  assert_difference('Item.count') do
  #    post :create, item: { info: @item.info, name: @item.name, preco_unitario: @item.preco_unitario, referencia: @item.referencia }
  #  end
  #
  #  assert_redirected_to item_path(assigns(:item))
  #end

  test "should show item" do
    log_in_as(users(:carlos))
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    log_in_as(users(:carlos))
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    log_in_as(users(:carlos))
    patch :update, id: @item, item: { info: @item.info, name: @item.name, preco_unitario: @item.preco_unitario, referencia: @item.referencia }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    log_in_as(users(:carlos))
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
