class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(user_params)
    if @user.save
      render :json => {:status => :ok, :user => @user }
    else
      render :json => {:status => :unprocessable_entity, :messages => @user.errors.full_messages }
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end