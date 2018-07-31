module V1
  class ServiceProvidersController < ApplicationController
  		before_action :set_service_provider, only: [:show, :update, :destroy]

      # GET /service_providers
  		def index
    		#@service_providers = current_user.service_providers.paginate(page: params[:page], per_page: 20)
        @service_providers = current_user.service_providers  
        @addresses = ServiceProvider.select('addresses.*').joins(:addresses).where("service_provider_id IN (?)", @service_providers.ids)
        @services = ServiceProvider.select('services.*').joins(:services).where("service_provider_id IN (?)", @service_providers.ids)
        @response = {:service_providers => @service_providers, :addresses => @addresses, :services => @services}
        json_response(@response)
      end

    # GET /service_providers/:id
    def show
      @address = ServiceProvider.select('addresses.*').joins(:addresses).where("service_provider_id = ?", @service_provider.id)
      @service = ServiceProvider.select('services.*').joins(:services).where("service_provider_id = ?", @service_provider.id)
      @response = {:service_provider => @service_provider, :addresses => @address, :services => @service}
      json_response(@response)
    end

    # POST /service_providers
    def create
      # create services belonging to current user
      @service_provider = current_user.service_providers.create!(service_provider_params)
      json_response(@service_provider, :created)
    end

      # PUT /service_providers/:id
    def update
      @service_provider.update(service_provider_params)
      head :no_content
    end

    # DELETE /service_providers/:id
    def destroy
      @service_provider.destroy
      head :no_content
    end

    private

    def service_provider_params
      params.permit(:title, :company_name, :phone, :email, :image)
    end

      def set_service_provider
        @service_provider = ServiceProvider.find(params[:id])
      end
    end
end

