class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    if params[:service].present? && params[:address].present?

      @providers = Provider.search(params[:service][:id], params[:address])

    else
      @providers = Provider.all
    end
      # @providers = Provider.where.not(latitude: nil, longitude: nil)
      @markers = @providers.map do |provider|
        {
          lat: provider.latitude,
          lng: provider.longitude#,
          # infoWindow: { content: render_to_string(partial: "/providers/map_box", locals: { flat: flat }) }
        }
      end
  end

  def show
    @provider_geo = [{
          lat: @provider.latitude,
          lng: @provider.longitude,
          range: @provider.range
        }]
  end

  def new
    @provider = Provider.new
    authorize @provider
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)
    @provider.service = Service.find(provider_params[:service_id]) unless provider_params[:service_id] == ""
    @provider.user = current_user
    authorize @provider

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
      authorize @provider
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :address, :email, :phone_number, :presentation, :range, :photo, :service_id)
    end

    def article_params
      params.require(:article).permit(:title, :body, :photo)
    end
end
