# to override Clearance's controller
# 1. make a new controller
# 2. inherit from Clearance's controller
# 3. make routes point to new controller

class UsersController < Clearance::UsersController
	def new
		@user = User.new
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end

# Clearance uses the old way of doing strong_params
# https://github.com/thoughtbot/clearance/blob/master/app/controllers/clearance/users_controller.rb#L48
# to be able to add a new attribute when creating a new user, you'll need to override Clearance's strong params
# `user_params` method above does the job.

# since Clearance::UsersController's new method uses `user_from_params`,
# and it'll not work since we overriden `user_params` method,
# override the `new` method/action to create empty User