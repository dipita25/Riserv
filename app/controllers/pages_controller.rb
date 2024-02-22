class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @enterprise = Enterprise.where(user_id: current_user.id)
    @text = ""
  end

  def recherche
    @text = params[:recherche]
    @enterprises = Enterprise.where("name LIKE ?", "%#{@text}%")
  end
end
