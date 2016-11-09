class SourcesController < ApplicationController
  before_action :set_source, only: [:show]

  def index
    @sources = Source.all
  end

  def show
    @home_work = HomeWork.new
    @events = @source.events.where("ends_at >= ?", DateTime.now).where.not(title: "").order('starts_at asc').limit(50)
  end

  private

  def set_source
    @source = Source.find(params[:id])
  end
end