class MahasiswaKelasController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_mahasiswa_kela, only: [:show, :edit, :update, :destroy]

  # GET /mahasiswa_kelas
  # GET /mahasiswa_kelas.json
  def index
    @mahasiswa_kelas = MahasiswaKela.all
  end

  # GET /mahasiswa_kelas/1
  # GET /mahasiswa_kelas/1.json
  def show
  end

  # GET /mahasiswa_kelas/new
  def new
    @mahasiswa_kela = MahasiswaKela.new
  end

  # GET /mahasiswa_kelas/1/edit
  def edit
  end

  # POST /mahasiswa_kelas
  # POST /mahasiswa_kelas.json
  def create
    @mahasiswa_kela = MahasiswaKela.new(mahasiswa_kela_params)

    respond_to do |format|
      if @mahasiswa_kela.save
        format.html { redirect_to @mahasiswa_kela, notice: 'Mahasiswa kela was successfully created.' }
        format.json { render :show, status: :created, location: @mahasiswa_kela }
      else
        format.html { render :new }
        format.json { render json: @mahasiswa_kela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mahasiswa_kelas/1
  # PATCH/PUT /mahasiswa_kelas/1.json
  def update
    respond_to do |format|
      if @mahasiswa_kela.update(mahasiswa_kela_params)
        format.html { redirect_to @mahasiswa_kela, notice: 'Mahasiswa kela was successfully updated.' }
        format.json { render :show, status: :ok, location: @mahasiswa_kela }
      else
        format.html { render :edit }
        format.json { render json: @mahasiswa_kela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mahasiswa_kelas/1
  # DELETE /mahasiswa_kelas/1.json
  def destroy
    @mahasiswa_kela.destroy
    respond_to do |format|
      format.html { redirect_to mahasiswa_kelas_url, notice: 'Mahasiswa kela was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mahasiswa_kela
      @mahasiswa_kela = MahasiswaKela.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mahasiswa_kela_params
      params.require(:mahasiswa_kela).permit(:mahasiswa_id, :kelas_id, :created_by, :updated_by)
    end
end
