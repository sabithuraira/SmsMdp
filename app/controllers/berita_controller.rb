class BeritaController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @datas = Berita.all
    end

    def search
        @datas = Berita.all
        if params[:search]
            @datas = Berita.search(params[:search])
        end

        render :partial => 'data'
    end

    def new
        @data=Berita.new
    end

    def create
        @data = Berita.new(berita_params)
 
        if @data.save
            redirect_to berita_path
        else
            render 'new'
        end
    end

    def edit
        @data=Berita.find(params[:id])
    end

    def update
        @data = Berita.find(params[:id])
        
        if @data.update(berita_params)
            redirect_to berita_path
        else
            render 'edit'
        end
    end

    def show
        @data = Berita.find(params[:id])
    end

    def destroy
        @data = Berita.find(params[:id])
        @data.destroy
        
        redirect_to berita_path
    end

    private
    def berita_params
        params.require(:berita).permit(:judul, :informasi, :is_sms)
    end
end
