class AuthenticationService
  def initialize(params, auth_data = nil) # default to nil to enable regular sign-in
    @params = params
    @auth_data = auth_data
  end

  def user
    @user ||= authenticate_user
  end

  def authenticated?
    user.present?
  end

  private

  def authenticate_user
    @auth_data ? authenticate_with_omniauth : authenticate_with_password
  end

  def authenticate_with_omniauth
    user = User.find_by_auth_data(@auth_data) || create_from_auth_data
  end

  def authenticate_with_password
    user = User.find_by_email(@params[:email])
    user && user.authenticate(@params[:password])
  end

  def create_from_auth_data
    User.where(@auth_data.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = @auth_data["provider"]
      user.uid = @auth_data["uid"]
      user.name = @auth_data["info"]["name"]
      user.oauth_token = @auth_data["credentials"]["token"]
      user.oauth_secret = @auth_data["credentials"]["secret"]
    end
  end
end
