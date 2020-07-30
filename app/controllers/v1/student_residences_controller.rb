# frozen_string_literal: true

module V1
  class StudentResidencesController < ApplicationController
    before_action :load_student_residence, only: [:show, :destroy, :update]

    def index
      @student_residences = StudentResidence.all

      render json: @student_residences
    end

    def show
      render json: @student_residence
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
      if @student_residence.update(student_residence_params)
        render json: @student_residence
      else
        render json: @student_residence.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @student_residence.destroy!
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

    def load_student_residence
      @student_residence ||= StudentResidence.find(params[:id])
    end
  end
end
