class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

   def create
     Rails.logger.info params[:headers][:subject]
     Rails.logger.info params[:headers][:to]
     Rails.logger.info params[:headers][:cc]
     Rails.logger.info params[:plain]
     Rails.logger.info params[:html]

     # Do some other stuff with the mail message
     @user = User.find_or_create_by_email(params[:envelope][:from])     
     # if params[:envelope][:from] != 'expected_user@example.com'
     #   render :text => 'success', :status => 200
     # else
     #   render :text => 'Unknown user', :status => 404 # 404 would reject the mail
     # end
   end  
end
