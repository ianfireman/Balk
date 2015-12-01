class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:update, :show, :index, :create, :destroy]
  before_action :correct_user,   only: [:show, :update, :destroy]

  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = current_user.empresas.all
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = current_user.empresas.build(empresa_params)
    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: 'Empresa criada com sucesso.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = current_user.empresas.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:nome_fantasia, :email, :razao_soc, :cnpj)
    end
    
    def correct_user
      @empresa = current_user.empresas.find_by(id: params[:id])
      redirect_to empresas_url if @empresa.nil?
    end
    
end
