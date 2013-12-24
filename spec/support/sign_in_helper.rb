module SignInHelpers
	def bypass_authentication
		current_user = AuthenticationService.new(nil, OmniAuth.config.mock_auth[:twitter]).user
    # session[:user_id] = current_user.id
	  current_user.tap do |user|
	  	user.email = "test@example.com"
	  end

	  ApplicationController.send(:alias_method, :old_current_user, :current_user)
	  ApplicationController.send(:define_method, :current_user) do
	    current_user
	  end
	end

	def restore_authentication
	  ApplicationController.send(:alias_method, :current_user, :old_current_user)
	end
end

RSpec.configure do |config|
  config.include SignInHelpers
end