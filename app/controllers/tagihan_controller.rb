class TagihanController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @datas = Tagihan.all
    end

    def search
        @datas = Tagihan.all
        if params[:search]
            @datas = Tagihan.search(params[:search])
        end

        render :partial => 'data'
    end

    def new
        @data=Tagihan.new
    end

    def create
        @data = Tagihan.new(tagihan_params)
 
        if @data.save
            redirect_to @data
        else
            render 'new'
        end
    end

    def edit
        @data=Tagihan.find(params[:id])
    end

    def update
        @data = Tagihan.find(params[:id])
        
        if @data.update(tagihan_params)
            redirect_to @data
        else
            render 'edit'
        end
    end

    def show
        @data = Tagihan.find(params[:id])
    end

    def destroy
        @data = Tagihan.find(params[:id])
        @data.destroy
        
        redirect_to tagihans_path
    end

    private
    def tagihan_params
        params.require(:tagihan).permit(:tahun_masuk, :bpp, :per_sks)
    end
end
