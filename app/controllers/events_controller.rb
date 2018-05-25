class EventsController < ApplicationController
  before_action :authenticate_user!
    before_action :set_event, only: [:show, :edit, :update, :destroy]
  
    def index
      @events = Event.where(schedule_id: current_user.schedule.id, start: params[:start]..params[:end]) 
    end
  
    def show
    end
  
    def new
      @event = Event.new
    end
  
    def edit
    end
  
    def create
      @event = Event.new(event_params)
      @event.save
    end
  
    def update
      @event.update(event_params)
    end
  
    def destroy
      @event.destroy
    end
  
    private
      def set_event
        @event = Event.find(params[:id])
      end
  
      def event_params
        params.require(:event).permit(:title, :date_range, :start, :end, :color, :dow)
      end
  end