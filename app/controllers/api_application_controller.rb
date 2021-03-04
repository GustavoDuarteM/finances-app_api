class ApiApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :check_auth_token

  private
  def check_auth_token
    token = request.headers['AUTHORIZATION'].split.last
    @user = User.find_by_token(token)
    render json: nil, status: :unauthorized unless @user.present?
  end
end
