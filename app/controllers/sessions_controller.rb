class SessionsController < Devise::SessionsController
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).
  def create
   self.resource = warden.authenticate!(auth_options)
   sign_in(resource_name, resource)
 
   current_user.update authentication_token: nil
   respond_to do |format|
      if params[:json]
        format.json {render :json => {:status => :ok,:user => current_user,}}
      else
        format.html { redirect_to index_path }
      end
   end
  end

  # DELETE /resource/sign_out
  def destroy
   respond_to do |format|
    if params[:json]
      format.json {
       if current_user
         current_user.update authentication_token: nil
         signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
         render :json => {:status => :ok}.to_json, :status => :ok
       else
         render :json => {:status => :unprocessable_entity}.to_json, :status => :unprocessable_entity
       end
     }
    else
      format.html { 
      current_user.update authentication_token: nil
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      redirect_to landing_page_path 
      }
    end
     
   end
  end
end