class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def index
    @courses = Course.all.as_json(include: [ :tutors ])
    render json: @courses
  end

  private

  def course_params
    params.require(:course).permit(:id, :name, :description, :cost,  tutors_attributes: [ :id, :name, :age, :experience, :_destroy])
  end
end