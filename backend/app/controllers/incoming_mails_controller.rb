class IncomingMailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

   def create
     Rails.logger.info "This works"
     Rails.logger.info params[:x_cc_header]
     # Rails.logger.info params[:headers][:subject]
     # Rails.logger.info params[:headers][:to]

     # Does CC even exist?
     # Rails.logger.info params[:headers][:cc]
     # Rails.logger.info params[:plain]
     # Rails.logger.info params[:html]

     # Do some other stuff with the mail message
     @user = User.find_or_create_by_email(params[:from])     
     @contact = @user.contacts.create email: params[:x_cc_header]
     @mj = MailJob.new @contact.id
     # get the data from the 'To' field
     
     # for now just assume 10s
     @dj = Delayed::Job.enqueue @mj, :priority => 0,  :run_at => 10.seconds.from_now

     render :json => 'success', :status => 200
   end  
end