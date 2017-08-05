class KelasController < ApplicationController
  before_action :set_kela, only: [:show, :edit, :update, :destroy]

  # GET /kelas
  # GET /kelas.json
  def index
    @kelas = Kela.all
  end

  def search
    @kelas = Kela.all
    if params[:search]
        @kelas = Kela.search(params[:search])
    end

    render :partial => 'data'
  end

  def subsetmahasiswa
    @subset =  Mahasiswa.all
    
    respond_to do |format|
        format.json { render json: @subset}
    end
  end

  def mahasiswa_rel
    @datas = MahasiswaKela.by_kelas(params[:id])
    
    respond_to do |format|
        format.json { render json: @datas.to_json(:include => :mahasiswa_rel)}
    end
  end

  def update_mahasiswa
    # @list_mahasiswa = params[:datas];

    @list_data = Array.new

    params[:datas].each do |data|
      @list_data.push({
        mahasiswa_id: data,
        kelas_id: params[:id],
        created_by: current_user.id,
        updated_by: current_user.id
      })
    end

    respond_to do |format|
      if MahasiswaKela.create(@list_data)
        format.json { render json: "success insert data", status: :ok }
      else
        format.json { render json: "failed to insert data", status: :unprocessable_entity }
      end
    end
  end

  def delete_mahasiswa
    @data = MahasiswaKela.find(params[:id])
    @data.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # GET /kelas/1
  # GET /kelas/1.json
  def show
  end

  # GET /kelas/new
  def new
    @kela = Kela.new
  end

  # GET /kelas/1/edit
  def edit
  end

  # POST /kelas
  # POST /kelas.json
  def create
    @kela = Kela.new(kela_params)
    @kela.created_by = current_user.id
    @kela.updated_by = current_user.id

    respond_to do |format|
      if @kela.save
        format.html { redirect_to @kela, notice: 'Kela was successfully created.' }
        format.json { render :show, status: :created, location: @kela }
      else
        format.html { render :new }
        format.json { render json: @kela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kelas/1
  # PATCH/PUT /kelas/1.json
  def update
    @kela.updated_by = current_user.id
    @list_mahasiswa = MahasiswaKela.by_kelas(@kela.id)

    respond_to do |format|
      if @kela.update(kela_params)
        format.html { redirect_to @kela, notice: 'Kelas was successfully updated.' }
        format.json { render :show, status: :ok, location: @kela }
      else
        format.html { render :edit }
        format.json { render json: @kela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kelas/1
  # DELETE /kelas/1.json
  def destroy
    @kela.destroy
    respond_to do |format|
      format.html { redirect_to kelas_url, notice: 'Kela was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kela
      @kela = Kela.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kela_params
      params.require(:kela).permit(:dosen_id, :mata_pelajaran_id, :tahun_ajaran, :nama, :created_by, :updated_by)
    end
end
