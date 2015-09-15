class StationsController < ApplicationController
  def index
    @stations = Station.all
    render json: @stations
  end

  def show
    @station = Station.find(params[:id])
    delta = @station.delta
    @station_status = Station.fetch(@station.cabi_id)
    render json: {
        station: @station,
        nbBikes: @station_status[:nbBikes].to_i,
        nbEmptyDocks: @station_status[:nbEmptyDocks].to_i,
        delta: delta
      }
  end

  def status
    @stations = Station.status
    render json: @stations.to_json
  end

end