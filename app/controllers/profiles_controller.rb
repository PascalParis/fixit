class ProfilesController < ApplicationController

  before_action :set_profile

  def new
    @profile = Profile.new
  end

  def show
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile, notice: 'Awesome'
    else
      render :new, errors: 'Something went wrong'
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Updated'
    else
      render :new, errors: 'Something went wrong'
    end
    authorize @profile
  end

  def destroy
    @profile.destroy
    redirect_to :root_path
    authorize @profile
  end

  private

  def set_profile
    @profile ||= current_user.profile if current_user.profile
    authorize @profile

  end

  def profile_params
    params.require(:profile).permit(
      :name,
      :mobile,
      :title,
      :work_email
    )
  end
end

