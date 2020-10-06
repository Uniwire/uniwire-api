module V1
  class EventsController < ApplicationController
    def index
      events = Event.all

      render json: events
    end

    def show
      render json: event
    end

    def create
      event = Event.new(event_params)

      if event.save
        render json: event, status: :created
      else
        render json: event.errors, status: :unprocessable_entity
      end
    end

    def update
      if event.update(event_params)
        render json: event
      else
        render json: event.errors, status: :unprocessable_entity
      end
    end

    def destroy
      event.destroy!
    end

    private

    def event_params
      params.require(:event).permit(
        :type,
        :description,
        :link,
        :date,
        :start_time,
        :end_time
      )
    end

    def event
      event ||= Event.find(params[:id])
    end
  end
end
