class ReviewsController < ApplicationController

  def index
    @enterprise = Enterprise.where(user_id: current_user.id)
    @reviews = Review.where(enterprise_id: @enterprise[0].id)
  end
end
