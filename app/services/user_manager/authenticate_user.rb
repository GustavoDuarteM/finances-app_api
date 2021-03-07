module UserManager
  class AuthenticateUser < ApplicationService
    attr_accessor :headers

    def initialize(headers)
      @headers = headers
    end

    def call
      token = headers['authorization'].split.last
      @user = User.find_by_token(token)
    rescue
      nil
    end
  end
end