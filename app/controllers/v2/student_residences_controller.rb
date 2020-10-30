# frozen_string_literal: true

module V2
  class StudentResidencesController < APIController
    def index
      student_residences = StudentResidenceResource.all(params)
      respond_with(student_residences)
    end

    def show
      student_residences = StudentResidenceResource.find(params)
      respond_with(student_residences)
    end

    def create
      student_residences = StudentResidenceResource.build(params)

      if student_residences.save
        render jsonapi: student_residences, status: 201
      else
        render jsonapi_errors: student_residences
      end
    end

    def update
      student_residences = StudentResidenceResource.find(params)

      if student_residences.update_attributes
        render jsonapi: student_residences
      else
        render jsonapi_errors: student_residences
      end
    end

    def destroy
      student_residences = StudentResidenceResource.find(params)

      if student_residences.destroy
        render jsonapi: { meta: {} }, status: 200
      else
        render jsonapi_errors: student_residences
      end
    end
  end
end
