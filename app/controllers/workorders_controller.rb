class WorkordersController < ApplicationController
  before_action :set_workorder, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @workorders = current_user.workorders

  end

  def show
  end

  def new
    @provider = Provider.find(params[:provider_id])
    @user = current_user
    @workorder = Workorder.new
    authorize @workorder
  end

  def create
    @workorder = Workorder.new(params[:id])
    @workorder.user = current_user
    @workorder.provider = Provider.find(params[:item_id])
    if @workorder.save!
      redirect_to user_workorder_path(current_user, @workorder)
    else
      render :new
    end
  end

  def delete
    @workorder.destroy
    redirect_to workorders_path
    authorize @workorder
  end

private

def set_workorder
  @workorder = Workorder.find(params[:id])
   authorize @workorder
end

end


 # @workorder = Workorder.new(params[:id])
 #    @workorder.user = current_user
 #    @workorder.provider = Provider.find(params[:item_id])
 #    if @workorder.save!
 #      redirect_to user_workorder_path(current_user, @workorder)
 #    else
 #      render :new
 #    end




