class HomeWorksController < ApplicationController
  before_action :connect
  before_action :set_event, except: [:index]
  before_action :set_home_work, except: [:index, :create, :new]

  def index
    @source = Source.find(params[:source_id])
    @home_works = @source.home_works
  end

  def show
  end

  def new
  	@home_work = @event.home_works.new
  end

  def edit
  end

  def create
  	@home_work = @event.home_works.create(home_work_params)
  end

  def update
  	@home_work.update(home_work_params)
    redirect_to source_path(@event.source, anchor: @event.id)
  end

  def destroy
  	@home_work.destroy
  end

  private

  def set_home_work
  	@home_work = @event.home_works.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def connect
  	#redirect_to new_session_path unless session[:admin]
  end

  def home_work_params
  	params.require(:home_work).permit(:title, :description)
  end
end