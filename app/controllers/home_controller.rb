class HomeController < ApplicationController
  def index
  	@packeges = Packege.all.count
  	@users = User.all.count
  	@travels = Travel.all.count
  	@senders = Sender.all.count
  end
end
