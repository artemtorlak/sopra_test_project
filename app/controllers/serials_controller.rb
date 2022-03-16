class SerialsController < ApplicationController

  def index
    if params[:search]
      @serials = FindAllSerialsWithActorService.new(actor_name: params[:search]).perform
    else
      @serials = Serial.all
    end
  end
end
