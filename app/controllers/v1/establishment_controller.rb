# frozen_string_literal: true

module V1
  class EstablishmentsController < ApplicationController
    def index
      @establishments = Establishment.all

      if @establishments.nil?
        render :unprocessable_entity
      else
        render json: {
          establishments = @establishments
        }
      end
    end

    def show
      @establishment = Establishment.find(params[:id])

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
      @establishment = Establishment.find(params[:id])

      if @establishment.update(establishment_params)
        render json: @establishment
      else
        render json: @establishment.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @establishment = Establishment.find(params[:id]).destroy
    end

    private

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
