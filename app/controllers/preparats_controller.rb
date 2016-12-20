class PreparatsController < ApplicationController
  before_action :set_preparat, only: [:show, :edit, :update, :destroy]

  # GET /preparats
  # GET /preparats.json
  def index
    @preparats = Preparat.all
    #Для подстановки нужны следующие переменные
    @manufacturers=Manufacturer.all
    @types=Type.all
    @providers=Provider.all
  end

  # GET /preparats/1
  # GET /preparats/1.json
  def show
  end

  # GET /preparats/new
  def new
    @preparat = Preparat.new
  end

  # GET /preparats/1/edit
  def edit
  end

  # POST /preparats
  # POST /preparats.json
  def create
    @preparat = Preparat.new(preparat_params)

    respond_to do |format|
      if @preparat.save
        format.html { redirect_to @preparat, notice: 'Новый препарат успешно добавлен.' }
        format.json { render :show, status: :created, location: @preparat }
      else
        format.html { render :new }
        format.json { render json: @preparat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preparats/1
  # PATCH/PUT /preparats/1.json
  def update
    respond_to do |format|
      if @preparat.update(preparat_params)
        format.html { redirect_to @preparat, notice: 'Информация о препарате была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @preparat }
      else
        format.html { render :edit }
        format.json { render json: @preparat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preparats/1
  # DELETE /preparats/1.json
  def destroy
    @preparat.destroy
    respond_to do |format|
      format.html { redirect_to preparats_url, notice: 'Информация о препарате была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preparat
      @preparat = Preparat.find(params[:id])
      #Также нужны переменные
      @manufacturer=Manufacturer.find(@preparat.manufacturer_id)
      @type=Type.find(@preparat.type_id)
      @provider=Provider.find(@preparat.provider_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preparat_params
      params.require(:preparat).permit(:name, :cost, :dateofmanufacturer, :shelflife, :description, :manufacturer_id, :type_id, :provider_id)
    end
end
