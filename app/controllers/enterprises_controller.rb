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
      redirect_to enterprises_path, notice: 'enterprise deleted successfully'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def params_enterprise
    params.require(:enterprise).permit(:user_id, :name, :address)
  end
end
