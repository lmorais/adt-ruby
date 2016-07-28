class HomeController < ApplicationController
  before_action :persist_makes, only: :index

  def index
    @makes ||= Make.all
  end

  private

  def persist_makes
    CreateVehicleMake.new.call
  end

end
