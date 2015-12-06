require 'test_helper'

class CollectionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:carlos)
    @empresa = empresas(:one)
    @collection = collections(:one)
    @collection.empresa_id = @empresa.id
    @collection.save
    @user.active_empresa = @empresa.id
    @user.save
  end

  test "should get index" do
    log_in_as(users(:carlos))
    get :index
    assert_response :success
    assert_not_nil assigns(:collections)
  end

  test "should get new" do
    log_in_as(users(:carlos))
    get :new
    assert_response :success
  end

  test "should create collection" do
    log_in_as(users(:carlos))
    assert_difference('Collection.count') do
      post :create, collection: { data_inicio: @collection.data_inicio, name: @collection.name }
    end

    assert_redirected_to collection_path(assigns(:collection))
  end

  test "should show collection" do
    log_in_as(users(:carlos))
    get :show, id: @collection
    assert_response :success
  end

  test "should get edit" do
    log_in_as(users(:carlos))
    get :edit, id: @collection
    assert_response :success
  end

  test "should update collection" do
    log_in_as(users(:carlos))
    patch :update, id: @collection, collection: { data_inicio: @collection.data_inicio, name: @collection.name }
    assert_redirected_to collection_path(assigns(:collection))
  end

  test "should destroy collection" do
    log_in_as(users(:carlos))
    assert_difference('Collection.count', -1) do
      delete :destroy, id: @collection
    end

    assert_redirected_to collections_path
  end
end
