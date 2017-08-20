class MahasiswaController < ApplicationController
    before_filter :authenticate_user!
  
    def index
        @datas = Mahasiswa.all
    end

    def search
        @datas = Mahasiswa.all
        if params[:search]
            @datas = Mahasiswa.search(params[:search])
        end

        render :partial => 'data'
    end

    def absen
        
    end

    def new
        @data=Mahasiswa.new
    end

    def create
        @data = Mahasiswa.new(mahasiswa_params)
 
        if @data.save
            redirect_to @data
        else
            render 'new'
        end
    end

    def edit
        @data=Mahasiswa.find(params[:id])
    end

    def update
        @data = Mahasiswa.find(params[:id])
        
        if @data.update(mahasiswa_params)
            redirect_to @data
        else
            render 'edit'
        end
    end

    def show
        @data = Mahasiswa.find(params[:id])
        @list_kelas = MahasiswaKela.by_mahasiswa(params[:id])
    end

    def destroy
        @data = Mahasiswa.find(params[:id])
        @data.destroy
        
        redirect_to mahasiswas_path
    end

    private
    def mahasiswa_params
        params.require(:mahasiswa).permit(:name,:nim,:date_birth,:place_birth,:parent_phone, :text)
    end
end
