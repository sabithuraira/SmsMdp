class MainController < ApplicationController
    before_filter :authenticate_user!
  
    layout "blank", only: [:index]

    def index
        @datas = Nilai.all
    end

    def berita
    end

    def search
        @datas = Nilai.all
        if params[:search]
            @datas = Nilai.search(params[:search])
        end

        render :partial => 'data'
    end

    def new
        @data=Nilai.new
    end

    def create
        @data = Nilai.new(nilai_params)
        @data.dosen = current_user.id

        if @data.save
            redirect_to @data
        else
            render 'new'
        end
    end

    def edit
        @data=Nilai.find(params[:id])
    end

    def update
        @data = Nilai.find(params[:id])
        @data = current_user.id
        
        if @data.update(nilai_params)
            redirect_to @data
        else
            render 'edit'
        end
    end

    def show
        @data = Nilai.find(params[:id])
    end

    def destroy
        @data = Nilai.find(params[:id])
        @data.destroy
        
        redirect_to nilais_path
    end

    private
    def nilai_params
        params.require(:nilai).permit(:dosen,:mp,:mahasiswa,:tahun_ajaran,:semester,:nilai)
    end

    private
    def login_params
        params.require(:session).permit(:email,:password, :nilai)
    end
end
