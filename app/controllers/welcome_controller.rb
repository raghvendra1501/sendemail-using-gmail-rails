class WelcomeController < ApplicationController
  def index
  end

  def send_email
  	flash[:message] = "Enter A Valid Email Address"
  	if params[:user][:email].present? && validate_email(params[:user][:email])
  		NotificationMailer.notification_email(params[:user][:email]).deliver_now
  		flash[:message] = "Mail sent to #{params[:user][:email]} successfully."
  	end
  	redirect_to root_path
  end

  private 

  def validate_email(email)
  	if ( email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i )
  		return true
  	end
  	return false
  end
end

