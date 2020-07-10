# frozen_string_literal: true

module V1
  class RiskAreasController < ApplicationController
    def index
      @risk_areas = RiskArea.all

      render json: {
        risk_areas: @risk_areas
      }
    end

    def show
      @risk_area = RiskArea.find(params[:id])

      render json: {
        residence: @risk_area
      }
    end

    def create
      @risk_area = RiskArea.new(risk_area_params)

      if @risk_area.save
        render json: @risk_area, status: :created
      else
        render json: @risk_area.errors, status: :unprocessable_entity
      end
    end

    def update
      @risk_area = RiskArea.find(params[:id])

      if @risk_area.update(risk_area_params)
        render json: @risk_area
      else
        render json: @risk_area.errors, status: :unprocessable_entity
      end
    end

    def destroy
      RiskArea.find(params[:id]).destroy
    end

    private

    def risk_area_params
      params.require(:risk_area).permit(:type, :description)
    end
  end
end