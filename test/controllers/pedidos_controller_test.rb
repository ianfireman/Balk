require 'test_helper'

class PedidosControllerTest < ActionController::TestCase
  setup do
    @user = users(:carlos)
    @empresa = empresas(:one)
    @cliente = clientes(:one)
    @cliente.empresa_id = @empresa.id
    @cliente.save
    @user.active_empresa = @empresa.id
    @user.save
    @pedido = pedidos(:one)
    @pedido.cliente_id = @cliente.id
  end

  test "should get index" do
    log_in_as(users(:carlos))
    get :index
    assert_response :success
    assert_not_nil assigns(:pedidos)
  end

  test "should get new" do
    log_in_as(users(:carlos))
    get :new
    assert_response :success
  end

  #test "should create pedido" do
  #  log_in_as(users(:carlos))
  #  assert_difference('Pedido.count') do
  #    post :create, pedido: { preco_total: @pedido.preco_total, qtd_itens: @pedido.qtd_itens }
  #  end

  # assert_redirected_to pedido_path(assigns(:pedido))
  #end

  #test "should show pedido" do
  #  log_in_as(users(:carlos))
  #  get :show, id: @pedido
  #  assert_response :success
  #end

  #test "should get edit" do
  #  log_in_as(users(:carlos))
  #  get :edit, id: @pedido
  #  assert_response :success
  #end

  #test "should update pedido" do
  #  log_in_as(users(:carlos))
  #  patch :update, id: @pedido, pedido: { preco_total: @pedido.preco_total, qtd_itens: @pedido.qtd_itens }
  #  assert_redirected_to pedido_path(assigns(:pedido))
  #end

  #test "should destroy pedido" do
  #  log_in_as(users(:carlos))
  #  assert_difference('Pedido.count', -1) do
  #    delete :destroy, id: @pedido
  #  end

  #  assert_redirected_to pedidos_path
  #end
end
