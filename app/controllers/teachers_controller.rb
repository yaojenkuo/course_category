class TeachersController < ApplicationController
    before_action :find_teacher, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @teachers = Teacher.all.order("name")
    end
    
    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)

        if @teacher.save
            redirect_to teachers_path
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @teacher.update(teacher_params)
            redirect_to teacher_path(@teacher)
        else
            render 'edit'
        end
    end

    def destroy
        @teacher.destroy
        redirect_to teachers_path
    end

    private
    def teacher_params
        params.require(:teacher).permit(:name, :experience, :teacher_img, :slug)
    end

    def find_teacher
        @teacher = Teacher.friendly.find(params[:id])
    end

end
