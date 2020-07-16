module V1
  class EventsController < ApplicationController
    def index
      @events = Event.all

      render json: {
        events: @events
      }
    end

    def show
      @event = Event.find(params[:id])

      render json: {
        event: @event
      }
    end

    def create
      @event = Event.new(event_params)

      if @event.save
        render json: @event, status: :created
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    def update
      @event = Event.find(params[:id])

      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    def destroy
      Event.find(params[:id]).destroy
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
  end
end
