class SourcesController < ApplicationController
  before_action :set_source, except: [:index]

  def index
    @sources = Source.all
  end

  def all_events
    @events = @source.ordered_events.where("starts_at > ?", 10.days.from_now)
  end

  def show
    @home_work = HomeWork.new
    @events = @source.ordered_events.limit(100)
  end

  private

  def set_source
    @source = Source.find(params[:id]||params[:source_id])
  end
end