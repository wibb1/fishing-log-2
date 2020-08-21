class RecordsController < ApplicationController

  def new
    @record = Record.new()
    @record.user = current_user
  end

  def create
    @record_new = Record.new()
    @record_new.name = create_params["name"]
    @record_new.success = create_params["success"]
    @record_new.body = create_params["body"]
    @record_new.latitude = create_params["latitude"]
    @record_new.longitude = create_params["longitude"]
    @record_new.datetime = create_params["datetime"]
    @record_new.date = create_params["datetime"].strftime
    @record_new.date = create_params["datetime"]

  end

  private

  def create_params
    params.require(:record).permit(:name, :success, :body, :latitude, :longitude, :datetime)
  end
end