class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:update, :show, :index, :create, :destroy]
  before_action :correct_empresa, only: [:show, :update, :destroy]
  before_action :empresa_ativa
  
  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = current_empresa.clientes.all
  end
  

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = current_empresa.clientes.build(cliente_params)
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente criado com sucesso.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nome_fantasia, :email, :cnpj, :razao_soc, :inscricao_es, :nome_comprador, :nome_banco, :agencia, :conta_corrente, :adress)
    end
    
    def empresa_ativa
      current_user.active_empresa > 0 ? true : (redirect_to admin_path, notice: 'Por favor ative alguma empresa.')
    end
    
    def correct_empresa
      @cliente = current_empresa.clientes.find_by(id: params[:id])
      redirect_to clientes_url if @cliente.nil?
    end
end