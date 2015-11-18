class Api::HomeController < ApplicationController
	include ApplicationHelper
	def profile
		user = User.find(params[:id]) 
		unless user.rankings.count.zero?
			ranking = (user.rankings.map{|r| r.ranking_value}.sum) / user.rankings.count
		else
			ranking = 0
		end
		
		user_array = ["name", "#{user.name} #{user.last_name}","pic","#{get_user_photo(user)}","phone", "#{user.phone}","age", "#{user.age}" ,"ranking", "#{ranking}" ,"email", "#{user.email}", "bio" ,"#{user.bio}", "city", "#{user.city}", "fb", "#{user.fb}", "tw", "#{user.tw}", "int", "#{user.int}"]
		@user = Hash[*user_array]
		render json: { user: @user, status: "ok" },status: 200
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
