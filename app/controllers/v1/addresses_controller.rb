module V1
    class AddressesController < ApplicationController
        before_action :set_service_provider
        before_action :set_service_provider_address, only: [:show, :update, :destroy]

        # GET /service_providers/:service_provider_id/addresses
        def index
          json_response(@service_provider.addresses)
        end

        # GET /service_providers/:service_provider_id/addresses/:id
        def show
          json_response(@address)
        end

        # POST /service_providers/:service_provider_id/addresses
        def create
          @service_provider.addresses.create!(address_params)
          json_response(@service_provider.addresses, :created)
        end

        # PUT /service_providers/:service_provider_id/addresses/:id
        def update
          @address.update(address_params)
          head :no_content
        end

        # DELETE /service_providers/:service_provider_id/addresses/:id
        def destroy
          @address.destroy
          head :no_content
        end

        private

        def address_params
          params.require(:address).permit(:address_line, :city, :pincode, :state, :country, :latitude, :longitude)
        end

        def set_service_provider
          @service_provider = ServiceProvider.find(params[:service_provider_id])
        end

        def set_service_provider_address
          @address = @service_provider.addresses.find_by!(id: params[:id]) if @service_provider
        end
    end
end