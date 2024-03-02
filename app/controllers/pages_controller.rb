class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def recherche
    @text = params[:recherche]
    if @text == "all"
      @text = ""
      @enterprises = Enterprise.near("Moka", 20000)
    else
      @services = Service.where("title LIKE ?", "%#{@text}%")
      @enterprises = Enterprise.joins(:services).where(services: { id: @services.map(&:id) }).distinct.near("Moka", 20000)

    end

    @my_position = Geocoder.search("Moka")
    @latitude = @my_position.first.coordinates[0]
    @longitude = @my_position.first.coordinates[1]
  end
end
