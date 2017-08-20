class DosenController < ApplicationController
    def index
        @datas = Dosen.all
    end

    def search
        @datas = Dosen.all
        if params[:search]
            @datas = Dosen.search(params[:search])
        end

        render :partial => 'data'
    end

    def new
        @data=Dosen.new
    end

    def create
        @data = Dosen.new(dosen_params)
 
        if @data.save
            redirect_to @data
        else
            render 'new'
        end
    end

    def edit
        @data=Dosen.find(params[:id])
    end

    def update
        @data = Dosen.find(params[:id])
        
        if @data.update(dosen_params)
            redirect_to @data
        else
            render 'edit'
        end
    end

    def show
        @data = Dosen.find(params[:id])
        @list_kelas = Kela.by_dosen(params[:id])
    end

    def destroy
        @data = Dosen.find(params[:id])
        @data.destroy
        
        redirect_to dosens_path
    end

    private
    def dosen_params
        params.require(:dosen).permit(:name, :nim, :date_birth, :place_birth, :text)
    end
end
