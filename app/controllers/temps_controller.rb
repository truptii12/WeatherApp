class TempsController < ApplicationController
  before_action :set_temp, only: [:show, :edit, :update, :destroy]

  # GET /temps
  # GET /temps.json
  def index
    @temps = Temp.all
  end

  # GET /temps/1
  # GET /temps/1.json
  def show
  end

  # GET /temps/new
  def new
    @temp = Temp.new
  end

  # GET /temps/1/edit
  def edit
  end

  # POST /temps
  # POST /temps.json
  def create
    @temp = Temp.new(temp_params)

    respond_to do |format|
      if @temp.save
        format.html { redirect_to @temp, notice: 'Temp was successfully created.' }
        format.json { render :show, status: :created, location: @temp }
      else
        format.html { render :new }
        format.json { render json: @temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temps/1
  # PATCH/PUT /temps/1.json
  def update
    respond_to do |format|
      if @temp.update(temp_params)
        format.html { redirect_to @temp, notice: 'Temp was successfully updated.' }
        format.json { render :show, status: :ok, location: @temp }
      else
        format.html { render :edit }
        format.json { render json: @temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temps/1
  # DELETE /temps/1.json
  def destroy
    @temp.destroy
    respond_to do |format|
      format.html { redirect_to temps_url, notice: 'Temp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp
      @temp = Temp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temp_params
      params.require(:temp).permit(:day, :min, :max, :night, :eve, :morn)
    end
end
