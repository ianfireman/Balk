class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:update, :show, :index, :create, :destroy]
  before_action :correct_collection, only: [:show, :update, :destroy]
  before_action :empresa_ativa
  
  # GET /items
  # GET /items.json
  def index
    @ids = []
    @collections = current_empresa.collections.all
    @collections.each do |c|
      @ids.push(c.id)
    end
    @items = Item.where(collection_id: @ids)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @collectionN = Collection.find(params[:collectionN])
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :referencia, :preco_unitario, :info, :collection_id)
    end
    
    def empresa_ativa
      current_user.active_empresa > 0 ? true : (redirect_to admin_path, notice: 'Por favor ative alguma empresa.')
    end
    
    def correct_collection 
      @item = Item.find(params[:id])
      @collections = current_empresa.collections.all
      @collections.each do |c|
        if(@item.collection_id == c.id)
          @pass = false #invertido para que passe a condiçao certa para o if do redirect_to
          break
        else
          @pass = true
        end
      end
      redirect_to collections_url if @pass
    end
end
