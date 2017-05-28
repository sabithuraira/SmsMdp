class MainController < ApplicationController
    layout "blank", only: [:login]
    def index
        @datas = Nilai.all
    end

    def login

    end

    def signin

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
end
