class OutboxController < ApplicationController
    before_filter :authenticate_user!
  
    def index
        @datas = Outbox.all
    end

    def search
        @datas = Outbox.all
        if params[:search]
            @datas = Outbox.search(params[:search])
        end

        render :partial => 'data'
    end
end
