class MailerController < ApplicationController
	def create
		@user = User.new(params[:user])
		puts "To:"
		puts "Subject"
		puts "Message"
	end

	private
		def user_mailer_params
			params.permit(:to, :subject, :message)
		end

		def set_mailer
        	@service_provider = User.find(params[:id])
		end
end
