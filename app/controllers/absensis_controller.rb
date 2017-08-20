class AbsensisController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_absensi, only: [:show, :edit, :update, :destroy]

  # GET /absensis
  # GET /absensis.json
  def index
    @absensis = Absensi.all
  end

  # GET /absensis/1
  # GET /absensis/1.json
  def show
  end

  # GET /absensis/new
  def new
    @absensi = Absensi.new
  end

  # GET /absensis/1/edit
  def edit
  end

  # POST /absensis
  # POST /absensis.json
  def create
    @absensi = Absensi.new(absensi_params)

    respond_to do |format|
      if @absensi.save
        format.html { redirect_to @absensi, notice: 'Absensi was successfully created.' }
        format.json { render :show, status: :created, location: @absensi }
      else
        format.html { render :new }
        format.json { render json: @absensi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /absensis/1
  # PATCH/PUT /absensis/1.json
  def update
    respond_to do |format|
      if @absensi.update(absensi_params)
        format.html { redirect_to @absensi, notice: 'Absensi was successfully updated.' }
        format.json { render :show, status: :ok, location: @absensi }
      else
        format.html { render :edit }
        format.json { render json: @absensi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absensis/1
  # DELETE /absensis/1.json
  def destroy
    @absensi.destroy
    respond_to do |format|
      format.html { redirect_to absensis_url, notice: 'Absensi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absensi
      @absensi = Absensi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def absensi_params
      params.require(:absensi).permit(:mahasiswa_id, :kelas_id, :pertemuan_ke, :flag, :keterangan, :created_by, :updated_by)
    end
end
