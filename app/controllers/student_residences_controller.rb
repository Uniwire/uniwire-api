class StudentResidencesController < ApplicationController
  def index
    student_residences = StudentResidenceResource.all(params)
    respond_with(student_residences)
  end

  def show
    student_residence = StudentResidenceResource.find(params)
    respond_with(student_residence)
  end

  def create
    student_residence = StudentResidenceResource.build(params)

    if student_residence.save
      render jsonapi: student_residence, status: 201
    else
      render jsonapi_errors: student_residence
    end
  end

  def update
    student_residence = StudentResidenceResource.find(params)

    if student_residence.update_attributes
      render jsonapi: student_residence
    else
      render jsonapi_errors: student_residence
    end
  end

  def destroy
    student_residence = StudentResidenceResource.find(params)

    if student_residence.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: student_residence
    end
  end
end
