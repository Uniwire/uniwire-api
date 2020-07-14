# frozen_string_literal: true

module V1
  class EstablishmentsController < ApplicationController
    before_action :load_establishment, only: [:show, :update, :destroy]

    def index
      @establishments = Establishment.all

      render json: {
        establishments = @establishments
      }
    end

    def show
      if @establishment.blank?
        head :not_found
      else
        render json: {
          establishment = @establishment
        }
      end
    end

    def create
      @establishment = Establishment.new(establishment_params)

      if @establishment.save
        render json: @establishment, status: :created
      else
        render json: @establishment.errors, status: :unprocessable_entity
      end
    end

    def update
      if @establishment.update(establishment_params)
        render json: @establishment
      else
        render json: @establishment.errors, status: :unprocessable_entity
      end
    end

    def destroy; end

    private

    def load_establishment
      @establishment ||= Establishment.find(params[:id])
    end

    def establishment_params
      params.require(:establishment).permit(
        :name,
        :description,
        :establishment_type,
        :delivery_availability,
        :price
      )
    end
  end
end
