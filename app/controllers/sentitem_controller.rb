class SentitemController < ApplicationController
    def index
        @datas = SentItem.all
    end

    def search
        @datas = SentItem.all
        if params[:search]
            @datas = SentItem.search(params[:search])
        end

        render :partial => 'data'
    end
end
