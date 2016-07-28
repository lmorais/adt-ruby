class ModelsController < ApplicationController
  before_action :persist_models, only: :index

  def index
    @models ||= Model.where(make_id: params[:webmotors_make_id]) 
  end


  private

  def persist_models
    CreateVehicleModel.new(webmotors_make_id: params[:webmotors_make_id]).call
  end

end