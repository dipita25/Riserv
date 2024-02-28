class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def recherche
    @text = params[:recherche]
    if @text == "all"
      @text = ""
      @enterprises = Enterprise.all
    else
      @services = Service.where("title LIKE ?", "%#{@text}%")
      @enterprises = Enterprise.joins(:services).where(services: { id: @services.map(&:id) }).distinct

    end


    @key = ENV['MAPBOX_API_KEY']

    @markers = @enterprises.geocoded.map do |enterprise|
      {
        lat: enterprise.latitude,
        lng: enterprise.longitude
      }
    end

    location = request.location
    @latitude = location.latitude
    @longitude = location.longitude

    puts "##########################################"
    puts location
    puts "###########################"

  end
end
