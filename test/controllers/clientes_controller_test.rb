require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { cnpj: @cliente.cnpj, email: @cliente.email, name: @cliente.nome_fantasia, razao: @cliente.razao_soc, inscricao: @cliente.inscricao_es, nome_comprador: @cliente.nome_comprador, nome_banco: @cliente.nome_banco, agencia: @cliente.agencia, conta_corrente: @cliente.conta_corrente }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { cnpj: @cliente.cnpj, email: @cliente.email, name: @cliente.nome_fantasia, razao: @cliente.razao_soc, inscricao: @cliente.inscricao_es, nome_comprador: @cliente.nome_comprador, nome_banco: @cliente.nome_banco, agencia: @cliente.agencia, conta_corrente: @cliente.conta_corrente }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
