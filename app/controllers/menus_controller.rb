class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
    @sort = params[:sort]
    if @sort == 'az'
      @dishes = Dish.order(:name).page params[:page]
    elsif @sort == 'za'
      @dishes = Dish.order(name: :desc).page params[:page]
    elsif @sort == 'priceLow'
      @dishes = Dish.order(:price).page params[:page]
    elsif @sort == 'priceHigh'
      @dishes = Dish.order(price: :desc).page params[:page]
    else
      @dishes = Dish.order(:created_at).page params[:page]
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menus = Menu.all
    @menu = Menu.find(params[:id])
    @sort = params[:sort]
    if @sort == 'az'
      @dishes = @menu.dishes.order(:name).page params[:page]
    elsif @sort == 'za'
      @dishes = @menu.dishes.order(name: :desc).page params[:page]
    elsif @sort == 'priceLow'
      @dishes = @menu.dishes.order(:price).page params[:page]
    elsif @sort == 'priceHigh'
      @dishes = @menu.dishes.order(price: :desc).page params[:page]
    else
      @dishes = @menu.dishes.order(:created_at).page params[:page]
    end
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name)
    end
end
