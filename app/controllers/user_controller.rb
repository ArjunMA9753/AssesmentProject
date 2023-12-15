class UserController < ApplicationController
	skip_before_action :verify_authenticity_token


	def user_create
		user_entry = User.where(email: params["email"]).last
		if user_entry.present?
			message = "User with Same email is Already Found"
		else
			user = User.create(name: params["name"], email: params["email"], age: params["age"], gender: params["gender"])
			message = user.try(:id).present? ? "User Created" : "Something went Wrong"
			notify_changes_to_third_parties if user.try(:id).present?
		end	
		render status: 200, json: message.to_json
	end

	def user_update
		user_entry = User.find_by_id(params["id"])
		if user_entry.present?
			user_entry.update(name: params["name"], email: params["email"], age: params["age"], gender: params["gender"])
			message = "User Details has been Updated"
			notify_changes_to_third_parties
		else
			message = "User Not Found"
		end	
		render status: 200, json: message.to_json
	end	

	private
	
	def user_params
  	params.require(:user).permit(:name, :email, :age, :gender)
	end
	
	def notify_changes_to_third_parties
		#We can add methods to add a notifier to third parties

		#Each Third parties api need to authenticate, so either we need to add the method of getting token or if its api key, we can mention as GLOBAL VARIABLE in environment file
	end	
end
