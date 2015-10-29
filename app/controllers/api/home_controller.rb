class Api::HomeController < ApplicationController
	def profile
		@user = User.find(params[:id])
		respond_to do |format|
			format.json do
				render :json => @user.to_json(:include => :couriers)
			end
		end
	end
end
