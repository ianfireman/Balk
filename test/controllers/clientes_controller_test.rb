require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @user = users(:carlos)
    @empresa = empresas(:one)
    @cliente = clientes(:one)
    @cliente.empresa_id = @empresa.id
    @cliente.save
    @user.active_empresa = @empresa.id
    @user.save
  end

  test "should get index" do
    log_in_as(users(:carlos))
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    log_in_as(users(:carlos))
    get :new
    assert_response :success
  end

  test "should create cliente" do
    log_in_as(users(:carlos))
    assert_difference('Cliente.count') do
      post :create, cliente: { cnpj: @cliente.cnpj, email: @cliente.email, nome_fantasia: @cliente.nome_fantasia, razao_soc: @cliente.razao_soc, inscricao_es: @cliente.inscricao_es, nome_comprador: @cliente.nome_comprador, nome_banco: @cliente.nome_banco, agencia: @cliente.agencia, adress: @cliente.adress,conta_corrente: @cliente.conta_corrente }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    log_in_as(users(:carlos))
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    log_in_as(users(:carlos))
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    log_in_as(users(:carlos))
    patch :update, id: @cliente, cliente: { cnpj: @cliente.cnpj, email: @cliente.email, name: @cliente.nome_fantasia, razao: @cliente.razao_soc, inscricao: @cliente.inscricao_es, nome_comprador: @cliente.nome_comprador, nome_banco: @cliente.nome_banco, agencia: @cliente.agencia, adress: @cliente.adress, conta_corrente: @cliente.conta_corrente }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    log_in_as(users(:carlos))
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
