class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @enterprise = Enterprise.where(user_id: current_user.id)
  end
end
