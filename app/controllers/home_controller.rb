class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	@packeges = Package.all.count
  	@users_count = User.all.count
  	@users = User.all
  	@travels = 0
  	@senders = 0
    @locations = Location.all.paginate(page: params[:page], per_page: 30)
  	data = [['Year', 'Sales'],
  	['2014', 1000],
  	['2014', 1170],
  	['2016', 660],
  	['2017', 1030]]
  	@data = (1..3).map do |i|{name: data.first[i],data: data[1..-1].map { |x| [ x[0], x[i] ] }}end

  end
  def profile
     @user = User.find(params[:id])
     @travels = Courier.where(user_id: params[:id])
     @packages = Remittent.where(user_id: params[:id])
  end

  def landing_page
  end

  def privacy
  end

  def terms
  end
  
  def service_support
  end
  
  
  def users_index
    @user = User.all
  end
end
