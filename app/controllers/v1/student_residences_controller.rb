# frozen_string_literal: true

module V1
  class StudentResidencesController < ApplicationController
    def index
      @student_residences = StudentResidence.all

      render json: {
        residences: @student_residences
      }
    end

    def show
      @student_residence = StudentResidence.find(params[:id])

      render json: {
        residence: @student_residence
      }
    end

    def create
      @student_residence = StudentResidence.new(student_residence_params)

      if @student_residence.save
        render json: @student_residence, status: :created
      else
        render json: @student_residence.errors, status: :unprocessable_entity
      end
    end

    def update
      @student_residence = StudentResidence.find(params[:id])

      if @student_residence.update(student_residence_params)
        render json: @student_residence
      else
        render json: @student_residence.errors, status: :unprocessable_entity
      end
    end

    def destroy
      StudentResidence.find(params[:id]).destroy
    end

    private

    def student_residence_params
      params.require(:student_residence).permit(
        :name,
        :property_type,
        :accomodation_type,
        :pet_friendly,
        :lgbt_friendly,
        :accept_smoker,
        :accept_alcoohol,
        :residents_gender,
        :internet,
        :furniture,
        :capacity
      )
    end
  end
end
