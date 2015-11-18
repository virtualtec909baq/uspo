class Api::HomeController < ApplicationController
	def profile
		@user = User.find(params[:id])
		respond_to do |format|
			format.json do
				render :json => @user.to_json(:include => :couriers)
			end
		end
	end

	def edit_profile
		@user = User.find(params[:id])
		if @user.update(user_params)
			render json: { message: @user, status: "ok" },status: 200
		else
			render json: { message: @user.errors, status: "not_found" },status: 422
		end
	end
	
	private
		# Only allow a trusted parameter "white list" through.
		def user_params
	      params.require(:user).permit(:email, :name, :age, :last_name, :phone, :occupation, :pic, :bio, :city, :tw, :fb, :int)
	    end
end
