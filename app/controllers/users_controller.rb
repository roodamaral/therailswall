class UsersController < ApplicationController


	def index 
	end 

	def create
		@user = User.new(user_params)
		if @user.save
		    flash[:notice] = ['User successfully created']
		    redirect_to user_messages_path(User.last.id)
	  	else
	  		flash[:notice] = @user.errors.full_messages
	  		redirect_to new_user_path
	  	end
  	end
  
  	def new
  	end

  	def show
 	end

  private

    def user_params
      params.require(:user).permit(:username)
    end

end
