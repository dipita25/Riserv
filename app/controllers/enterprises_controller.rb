class EnterprisesController < ApplicationController


  def new
    @enterprise = Enterprise.new
  end

  def create
    @enterprise = Enterprise.new(params_enterprise)
    if @enterprise.save
      redirect_to enterprise_path(@enterprise), notice: 'enterprise created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @enterprises = Enterprise.all
  end

  def show
    @enterprise = Enterprise.find(params[:id])
  end

  def edit
    @enterprise = Enterprise.find(params[:id])
  end

  def update
    @enterprise = Enterprise.find(params[:id])
    if @enterprise.update(params_enterprise)
      redirect_to enterprise_path(@enterprise.id), notice: 'enterprise updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @enterprise = Enterprise.find(params[:id])
    if @enterprise.destroy
      redirect_to root_path, notice: 'enterprise deleted successfully'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def add_to_favorites
    @enterprise_id = params[:enterprise_id]

    if Favorite.where(enterprise_id: @enterprise_id, user_id: current_user.id).length == 0
      @favorite = Favorite.new({user_id: current_user.id, enterprise_id: @enterprise_id})
      if @favorite.save
        redirect_to root_path, notice: 'enterprise successfully added to favorites'
      end
    else
      redirect_to root_path, notice: 'unable to add to favorites'
    end

  end

  def remove_to_favorites
    @enterprise_id = params[:enterprise_id]
    @favorite = Favorite.where(user_id: current_user.id, enterprise_id: @enterprise_id).first
    if @favorite.destroy
      redirect_to root_path, notice: 'enterprise successfully removed to favorites'
    end
  end

  private

  def params_enterprise
    params.require(:enterprise).permit(:user_id, :name, :address, :photo)
  end
end
