class MpController < ApplicationController
    def index
        @datas = MataPelajaran.all
    end

    def search
        @datas = MataPelajaran.all
        if params[:search]
            @datas = MataPelajaran.search(params[:search])
        end

        render :partial => 'data'
    end

    def new
        @data=MataPelajaran.new
    end

    def create
        @data = MataPelajaran.new(mata_pelajaran_params)
 
        if @data.save
            redirect_to @data
        else
            render 'new'
        end
    end

    def edit
        @data=MataPelajaran.find(params[:id])
    end

    def update
        @data = MataPelajaran.find(params[:id])
        
        if @data.update(mata_pelajaran_params)
            redirect_to @data
        else
            render 'edit'
        end
    end

    def show
        @data = MataPelajaran.find(params[:id])
    end

    def destroy
        @data = MataPelajaran.find(params[:id])
        @data.destroy
        
        redirect_to mata_pelajarans_path
    end

    private
    def mata_pelajaran_params
        params.require(:mata_pelajaran).permit(:name, :text)
    end
end
