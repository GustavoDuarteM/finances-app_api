class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!, only: [:google_oauth2]

  def google_oauth2
    @auth = request.env['omniauth.auth']
    @user = User.where(email: @auth.info.email).first_or_initialize(auth_params_user)

    if @user.persisted? && @user.update(credentials_params_user)
      sign_in(:user, @user)
      redirect_to panel_index_path
    elsif @user.save
      sign_in(:user, @user)
      redirect_to panel_index_path
    else
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
  
  private

  def auth_params_user
    uid = @auth.uid
    credentials = @auth.credentials
    info = @auth.info

    {
      uid: uid,
      email: info.email,
      name: info.name,
      image_url: info.image,
      token: credentials.token,
      expires_at: credentials.expires_at,
      refresh_token: credentials.refresh_token,
      expires: credentials.expires
    }

  end
  def credentials_params_user
    credentials = @auth.credentials
    {
      token: credentials.token,
      expires_at: credentials.expires_at,
      refresh_token: credentials.refresh_token,
      expires: credentials.expires
    }
  end


end
