class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        if params[:category].blank?
            @courses = Course.all.order("startdate ASC") # may switch to start_date
        else
            @category_id = Category.find_by(name: params[:category]).id
            @courses = Course.where(:category_id => @category_id).order("startdate ASC") # may switch to start_date
        end
    end

    def new
        @course = Course.new
        @categories = Category.all.map{ |c| [c.name, c.id] }
        @teachers = Teacher.all.map{ |c| [c.name, c.id] }
    end

    def create
        @course = Course.new(course_params)
        @course.category_id = params[:category_id]
        @course.teacher_id = params[:teacher_id]

        if @course.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def show
    end

    def edit
        @categories = Category.all.map{ |c| [c.name, c.id] }
        @teachers = Teacher.all.map{ |c| [c.name, c.id] }
    end

    def update
        @course.category_id = params[:category_id]
        @course.teacher_id = params[:teacher_id]
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            render 'edit'
        end
    end

    def destroy
        @course.destroy
        redirect_to root_path
    end

    private
    def course_params
        params.require(:course).permit(:title, :description, :length, :register_url, :category_id, :course_img, :teacher_id, :startdate)
    end

    def find_course
        @course = Course.find(params[:id])
    end
end
