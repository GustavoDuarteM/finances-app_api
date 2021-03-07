class ApiApplicationController < ActionController::API
  include UserManager
  before_action :check_auth_token

  private
  def check_auth_token
    @user = AuthenticateUser.call(request.headers)
    render json: nil, status: :unauthorized if @user.blank?
  end
end
