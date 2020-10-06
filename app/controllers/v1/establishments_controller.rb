# frozen_string_literal: true

module V1
  class EstablishmentsController < ApplicationController
    def index
      establishments = Establishment.all

      render json: establishments
    end

    def show
      render json: establishment
    end

    def create
      establishment = Establishment.new(establishment_params)

      if establishment.save
        render json: establishment, status: :created
      else
        render json: establishment.errors, status: :unprocessable_entity
      end
    end

    def update
      if establishment.update(establishment_params)
        render json: establishment
      else
        render json: establishment.errors, status: :unprocessable_entity
      end
    end

    def destroy
      establishment.destroy!
    end

    private

    def establishment
      establishment ||= Establishment.find(params[:id])
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
