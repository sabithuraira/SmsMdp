class UserController < ApplicationController
    before_filter :authenticate_user!
  
    def index
        @datas = User.all
    end

    def search
        @datas = User.all
        if params[:search]
            @datas = User.search(params[:search])
        end

        render :partial => 'data'
    end

    def new
        @data=User.new
    end

    def create
        @data = User.new(user_params)
 
        if @data.save
            redirect_to @data
        else
            render 'new'
        end
    end

    def edit
        @data=User.find(params[:id])
    end

    def update
        @data = User.find(params[:id])
        
        if @data.update(user_params)
            redirect_to @data
        else
            render 'edit'
        end
    end

    def show
        @data = User.find(params[:id])
    end

    def destroy
        @data = User.find(params[:id])
        @data.destroy
        
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:name,:password, :password_confirmation, :email ,:date_birth,:place_birth, :text)
    end
end
