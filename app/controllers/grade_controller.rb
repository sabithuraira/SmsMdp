class GradeController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @datas = Grade.all
    end

    def search
        @datas = Grade.all
        if params[:search]
            @datas = Grade.search(params[:search])
        end

        render :partial => 'data'
    end

    def new
        @data=Grade.new
    end

    def create
        @data = Grade.new(grade_params)
 
        if @data.save
            redirect_to grades_path
        else
            render 'new'
        end
    end

    def edit
        @data=Grade.find(params[:id])
    end

    def update
        @data = Grade.find(params[:id])
        
        if @data.update(grade_params)
            redirect_to grades_path
        else
            render 'edit'
        end
    end

    def show
        @data = Grade.find(params[:id])
    end

    def destroy
        @data = Grade.find(params[:id])
        @data.destroy
        
        redirect_to grades_path
    end

    private
    def grade_params
        params.require(:grade).permit(:grade, :grade_value, :min_value, :max_value)
    end
end
