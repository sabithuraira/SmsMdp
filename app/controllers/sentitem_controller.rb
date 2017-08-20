class SentitemController < ApplicationController
    before_filter :authenticate_user!
  
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
