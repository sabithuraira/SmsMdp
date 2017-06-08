class OutboxController < ApplicationController
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
