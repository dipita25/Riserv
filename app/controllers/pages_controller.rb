class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    
  end

  def recherche
    @text = params[:recherche]
    @enterprises = Enterprise.where("name LIKE ?", "%#{@text}%")
  end
end
