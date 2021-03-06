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
            redirect_to tagihans_path
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
            redirect_to tagihans_path
        else
            render 'edit'
        end
    end

    def show
        @data = Tagihan.find(params[:id])
    end


    def sms
        @data = Tagihan.find(params[:id])

        @mahasiswas = Mahasiswa.where('SUBSTRING(nim,1,4)=?',@data.tahun_masuk)
        @mahasiswas.each do |m|
            sms = Outbox.new
            sms.DestinationNumber= m.parent_phone
            
            sms.TextDecoded= "INFO PEMBAYARAN: Jadwal pembayaran BPP/SKS dari dd/mm/yy s/d dd/mm/yy. Ketik HELP untuk bantuan."
            # sms.TextDecoded= "Salam, bayaran nilai dari #{m.name} BPP adalah #{@data.bpp} dan per SKS adalah #{@data.per_sks}. Terima kasih"
            sms.CreatorID= "Gammu"
            sms.save
        end
        
        flash[:success] = 'SMS berhasil diinput'
        redirect_to tagihans_path
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
