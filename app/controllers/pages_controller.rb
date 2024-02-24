class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

  end

  def recherche
    @text = params[:recherche]
    @services = Service.where("title LIKE ?", "%#{@text}%")
    @enterprises = Enterprise.joins(:services).where(services: { id: @services.map(&:id) }).distinct

  end
end
