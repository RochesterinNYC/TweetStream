class SessionsController < ApplicationController
  #exceptions = login + signup + logout
  skip_before_filter  :verify_authenticity_token
  skip_before_filter :require_user, :only => [:new, :create, :destroy]
  def new
  end

  def create
    authenticator = AuthenticationService.new(
                      session_params,
                      env['omniauth.auth']
                    )
    if authenticator.authenticated?
      user = authenticator.user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:alert] = "Username or password is invalid.  Please try again."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to welcome_path
  end

  private

  def session_params
    # params.permit(:session)
    # params.permit(:email, :password, :password_confirmation, :authenticity_token, :session, :commit)
    params.require(:session).permit(:email, :password, :password_confirmation, :authenticity_token, :session, :commit) if params[:session]
  end
end
