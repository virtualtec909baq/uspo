class Api::HomeController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
	include ApplicationHelper

	def profile
		@user = []
		if user = User.find(params[:id]) 
			unless user.rankings.count.zero?
				ranking = (user.rankings.map{|r| r.ranking_value}.sum) / user.rankings.count
			else
				ranking = 0
			end
			user_array = ["id", "#{user.id}","name", "#{user.name} #{user.last_name}","pic","#{get_user_photo(user)}","phone", "#{user.phone}","age", "#{user.age}" ,"ranking", "#{ranking}" ,"occupation", "#{user.occupation}","email", "#{user.email}", "bio" ,"#{user.bio}", "city", "#{user.city}", "fb", "#{user.fb}", "tw", "#{user.tw}", "int", "#{user.int}"]
			user_hash = Hash[*user_array]
			@user << user_hash
			render json: { user: @user, status: "ok" },status: 200
		else
			record_not_found(error)
		end
	end

	def edit_profile
		user = []
		@user = User.find(params[:id]) 
		if @user.update(user_params)
			user_array = ["id", "#{@user.id}","name", "#{@user.name} #{@user.last_name}","pic","#{get_user_photo(@user)}","phone", "#{@user.phone}","age", "#{@user.age}" ,"email", "#{@user.email}", "bio" ,"#{@user.bio}", "city", "#{@user.city}", "fb", "#{@user.fb}", "tw", "#{@user.tw}", "int", "#{@user.int}"]
			user_hash = Hash[*user_array]
			user << user_hash
			render json: { user: user, status: "ok" },status: 200
		else
			render json: { user: @user.errors, status: "not_found" },status: 422
		end
	end
	
	private
		def record_not_found(error)
			render :json => {:error => error.message}, :status => :not_found
		end 
		# Only allow a trusted parameter "white list" through.
		def user_params
	      params.require(:user).permit(:email, :name, :age, :last_name, :phone, :occupation, :pic, :bio, :city, :tw, :fb, :int)
	    end
end
