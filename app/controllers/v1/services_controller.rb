module V1
	class ServicesController < ApplicationController
		before_action :set_service_provider
        before_action :set_service_provider_service, only: [:show, :update, :destroy]

        # GET /service_providers/:service_id/services
        def index
        	json_response(@service_provider.services)
        end

        # GET /service_providers/:service_provider_id/items/:id
    	def show
        	json_response(@service)
        end

        # POST /service_providers/:service_provider_id/services
        def create
          	@service_provider.services.create!(service_params)
          	json_response(@service_provider.services, :created)
        end

        # PUT /service_providers/:service_provider_id/services/:id
        def update
          	@service.update(service_params)
          	head :no_content
        end

        # DELETE /service_providers/:service_provider_id/services/:id
        def destroy
          	@service.destroy
         	head :no_content
        end

        private

        def service_params
          	params.permit(:category)
        end

        def set_service_provider
          	@service_provider = ServiceProvider.find(params[:service_provider_id])
        end

        def set_service_provider_service
          	@service = @service_provider.services.find_by!(id: params[:id]) if @service_provider
        end
	end
end
