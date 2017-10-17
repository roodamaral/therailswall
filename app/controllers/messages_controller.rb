class MessagesController < ApplicationController
	before_filter :load_user

	def index
		@messages = Message.includes(:user)
	end 

	def create
		@message = Message.new(message_params)
		@message.user = @user
		if @message.save
		    flash[:notice] = ['Message successfully created']
		    redirect_to user_messages_path(@user.id)
  		else
  			flash[:notice] = @message.errors.full_messages
  			redirect_to user_messages_path(@user.id)
  		end
  	end

  	def new
  	end

  	def show
  	end


private 

	def load_user
		@user = User.find(params[:user_id])
	end

    def message_params
      params.require(:message).permit(:message)
    end
end
