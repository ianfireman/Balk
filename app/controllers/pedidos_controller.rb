class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :empresa_ativa
  # GET /pedidos
  # GET /pedidos.json
  def index
    @ids = []
    @clientes = current_empresa.clientes.all
    @clientes.each do |c|
      @ids.push(c.id)
    end
    @pedidos = Pedido.where(cliente_id: @ids)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @ids = []
    @relations = Relation.where(pedido_id: params[:id])
    @relations.each do |r|
      @ids.push(r.item_id)
    end
    @items = Item.where(id: @ids)
  end
  
  def addItems
    @pedido = Pedido.find(params[:pedidoN])
    @ids = []
    @collections = current_empresa.collections.all
    @collections.each do |c|
      @ids.push(c.id)
    end
    @items = Item.where(collection_id: @ids)
  end
  
  # GET /pedidos/new
  def new
    @ids = []
    @collections = current_empresa.collections.all
    @collections.each do |c|
      @ids.push(c.id)
    end
    @items = Item.where(collection_id: @ids)
    @pedido = Pedido.new
    
    @items.length.times do
      relation = @pedido.relations.new
    end
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    respond_to do |format|
      if @pedido.save
        
        @relation = pedido_params[:relations_attributes]
        @relation.each do |f|
          if f[1][:quantidade].to_i > 0
            paramsToBuild = { "quantidade" => f[1][:quantidade], "item_id" => f[1][:item_id], "cliente_id" => pedido_params[:cliente_id]}
            @relationsave = @pedido.relations.build(paramsToBuild)
            @relationsave.save
          end
        end
        
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end
    
    def empresa_ativa
      current_user.active_empresa > 0 ? true : (redirect_to admin_path, notice: 'Por favor ative alguma empresa.')
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:qtd_itens, :preco_total, :cliente_id, relations_attributes: [:id, :item_id, :quantidade])
    end
end
