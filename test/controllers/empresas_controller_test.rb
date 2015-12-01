require 'test_helper'

class EmpresasControllerTest < ActionController::TestCase
  setup do
    @user = users(:carlos)
    @empresa = empresas(:one)
    @empresa.user_id = @user.id
    @empresa.save
  end

  test "should get index" do
    log_in_as(users(:carlos))
    get :index
    assert_response :success
    assert_not_nil assigns(:empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empresa" do
    log_in_as(users(:carlos))
    assert_difference('Empresa.count') do
      post :create, empresa: {email: @empresa.email, nome_fantasia: @empresa.nome_fantasia, cnpj: @empresa.cnpj, razao_soc: @empresa.razao_soc }
    end

    assert_redirected_to empresa_path(assigns(:empresa))
  end

  test "should show empresa" do
    log_in_as(users(:carlos))
    get :show, id: @empresa
    assert_response :success
  end

  test "should get edit" do
    log_in_as(users(:carlos))
    get :edit, id: @empresa
    assert_response :success
  end

  test "should update empresa" do
    log_in_as(users(:carlos))
    patch :update, id: @empresa, empresa: {email: @empresa.email, nome_fantasia: @empresa.nome_fantasia, cnpj: @empresa.cnpj, razao_soc: @empresa.razao_soc }
    assert_redirected_to empresa_path(assigns(:empresa))
  end

  test "should destroy empresa" do
    log_in_as(users(:carlos))
    assert_difference('Empresa.count', -1) do
      delete :destroy, id: @empresa
    end

    assert_redirected_to empresas_path
  end
  
  
end
