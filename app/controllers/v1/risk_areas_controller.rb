# frozen_string_literal: true

module V1
  class RiskAreasController < ApplicationController
    def index
      risk_areas = RiskArea.all

      render json: risk_areas
    end

    def show
      render json: risk_area
    end

    def create
      risk_area = RiskArea.new(risk_area_params)

      if risk_area.save
        render json: risk_area, status: :created
      else
        render json: risk_area.errors, status: :unprocessable_entity
      end
    end

    def update
      if risk_area.update(risk_area_params)
        render json: risk_area
      else
        render json: risk_area.errors, status: :unprocessable_entity
      end
    end

    def destroy
      risk_area.destroy!
    end

    private

    def risk_area_params
      params.require(:risk_area).permit(:type, :description)
    end

    def risk_area
      risk_area ||= RiskArea.find(params[:id])
    end
  end
end
