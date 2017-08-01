class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]

    def index
        if params[:category].blank?
            @courses = Course.all.order("created_at DESC") # may switch to start_date
        else
            @category_id = Category.find_by(name: params[:category]).id
            @courses = Course.where(:category_id => @category_id).order("created_at DESC") # may switch to start_date
        end
    end

    def new
        @course = Course.new
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end

    def create
        @course = Course.new(course_params)
        @course.category_id = params[:category_id]

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
    end

    def update
        @course.category_id = params[:category_id]
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
        params.require(:course).permit(:title, :description, :length, :teacher, :register_url, :category_id)
    end

    def find_course
        @course = Course.find(params[:id])
    end
end
