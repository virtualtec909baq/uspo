class Api::PackagesController < ApplicationController
	before_action :set_package, only: [:show, :edit, :update, :destroy]
	
	def index
	  if params[:profile]
	  	@packages = []
	  	@couriers = Courier.where(user_id: params[:current_user])
		@couriers.each do |c|
			Package.where(courier_id: c.id, acceted_request: true).each do |u|
				User.where(id: u.user_id).each do |us|
					unless us.rankings.count.zero?
						ranking = (us.rankings.map{|ran| ran.ranking_value}.sum) / us.rankings.count.to_f
					else
						ranking = 0
					end
         			array_user = "id", "#{u.id}", "acceted_request", "#{u.acceted_request}","courier_id", "#{u.courier_id}","remittent_id", "#{u.remittent_id}","status", "#{u.status}","name_package", "#{u.name}","city", "#{u.city}","zipe_code", "#{u.zipe_code}","place", "#{u.place}","date", "#{u.date}","description", "#{u.description}","phone", "#{u.phone}", "courier_id", "#{u.courier_id}", "id_user", "#{us.id}", "name", "#{us.name}", "pic", "#{us.pic},", "email", "#{us.email},", "phone_user", "#{us.phone},", "bio", "#{us.bio},", "ranking", "#{ranking.round(1)}"
          			h_user = Hash[*array_user]
          			@packages << h_user
      		  	end	
      		end
      	end
      	@remittents = Remittent.where(user_id: params[:current_user])
		@remittents.each do |r|
			Package.where(remittent_id: r.id, acceted_request: true).each do |u|
				 User.where(id: u.user_id).each do |us|
				 	unless us.rankings.count.zero?
						ranking = (us.rankings.map{|ran| ran.ranking_value}.sum) / us.rankings.count.to_f
					else
						ranking = 0
					end
         			array_user = "id", "#{u.id}", "acceted_request", "#{u.acceted_request}","courier_id", "#{u.courier_id}","remittent_id", "#{u.remittent_id}","status", "#{u.status}","name_package", "#{u.name}","city", "#{u.city}","zipe_code", "#{u.zipe_code}","place", "#{u.place}","date", "#{u.date}","description", "#{u.description}","phone", "#{u.phone}", "courier_id", "#{u.courier_id}", "id_user", "#{us.id}", "name", "#{us.name}", "pic", "#{us.pic}", "email", "#{us.email},", "phone_user", "#{us.phone},", "bio", "#{us.bio},", "ranking", "#{ranking.round(1)}"
         			h_user = Hash[*array_user]
        			@packages << h_user
        		end
        	end
      	end
      elsif params[:history]
      		@packages = []
      		Package.where(user_id: params[:current_user], acceted_request: true).each do |u|
      			if(u.courier_id.blank?)
      				unless u.remittent.user.rankings.count.zero?
						ranking = (u.remittent.user.rankings.map{|ran| ran.ranking_value}.sum) / u.remittent.user.rankings.count.to_f
					else
						ranking = 0
					end
					array_user = "id", "#{u.id}", "acceted_request", "#{u.acceted_request}","courier_id", "#{u.courier_id}","remittent_id", "#{u.remittent_id}","status", "#{u.status}","name_package", "#{u.name}","city", "#{u.city}","zipe_code", "#{u.zipe_code}","place", "#{u.place}","date", "#{u.date}","description", "#{u.description}","phone", "#{u.phone}", "id_user", "#{u.remittent.user.id}", "name", "#{u.remittent.user.name}", "pic", "#{u.remittent.user.pic}", "email", "#{u.remittent.user.email},", "phone_user", "#{u.remittent.user.phone},", "bio", "#{u.remittent.user.bio},", "ranking", "#{ranking.round(1)}"
					h_user = Hash[*array_user]
        			@packages << h_user
      			else
      				unless u.courier.user.rankings.count.zero?
					ranking = (u.courier.user.rankings.map{|ran| ran.ranking_value}.sum) / u.courier.user.rankings.count.to_f
					else
						ranking = 0
					end
					array_user = "id", "#{u.id}", "acceted_request", "#{u.acceted_request}","courier_id", "#{u.courier_id}","remittent_id", "#{u.remittent_id}","status", "#{u.status}","name_package", "#{u.name}","city", "#{u.city}","zipe_code", "#{u.zipe_code}","place", "#{u.place}","date", "#{u.date}","description", "#{u.description}","phone", "#{u.phone}", "id_user", "#{u.courier.user.id}", "name", "#{u.courier.user.name}", "pic", "#{u.courier.user.pic},", "email", "#{u.courier.user.email},", "phone_user", "#{u.courier.user.phone},", "bio", "#{u.courier.user.bio},", "ranking", "#{ranking.round(1)}"
					h_user = Hash[*array_user]
        			@packages << h_user
      			end
        	end
      else
		@packages = Package.all
	  end

		render json: { packages: @packages, status: "ok" },status: 200
	end

	# GET /remittents/1
	def show
		package = []
		package << @package
		render json: { package: package, status: "ok" },status: 200
	end

	# POST /packages
	def create
		package = []
		@package = Package.new(packege_params)
		if @package.save
			package << @package
			render json: { package: package, status: "ok" },status: 200
		else 
			render json: { package: @package.errors, status: "not_found" },status: 422
		end
	end

	# PATCH/PUT /couriers/1
	def update
		package = []
		if @package.update(packege_params)
			package << @package
			unless @package.remittent_id.blank?
				@packages = Package.where("(remittent_id = ?) AND id != ?", @package.remittent_id, @package.id) 
				@packages.update_all(acceted_request: false)
			end
			render json: { package: @package, status: "ok" },status: 200
		else 
			render json: { message: @package.errors, status: "not_found" },status: 422
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      if @package = Package.find(params[:id])
      else 
        record_not_found(error)
      end
    end

    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end 

    # Only allow a trusted parameter "white list" through.
    def packege_params
      params.require(:package).permit!
    end
end