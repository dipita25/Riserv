class ReviewsController < ApplicationController

  def index
    @enterprise = Enterprise.find(params[:enterprise_id])
    @reviews = Review.where(enterprise_id: @enterprise.id)
  end

  def new
    @review = Review.new
    @enterprise_id = params[:enterprise_id]
  end

  def create
    @review = Review.new(params_reviews)
    if @review.save
      redirect_to enterprise_reviews_path(@review.enterprise_id), notice: 'review created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    @enterprise_id = @review.enterprise_id
    @user_id = current_user.id
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(params_reviews)
      redirect_to enterprise_reviews_path(@review.enterprise_id), notice: 'review updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to enterprise_reviews_path(@review.enterprise_id), notice: 'review deleted successfully'
    else
      render :show, status: :unprocessable_entity
    end
  end
  private
  def params_reviews
    params.require(:review).permit(:user_id, :enterprise_id, :content)
  end
end
