class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :job_id, :last_name, :phone, :when
  
  belongs_to :user
  
  def remind
    # make a POST request to MailGun to send the email
    data = Multimap.new
    data[:from] = "Automatic mailer <me@samples.mailgun.org>"
    data[:to] = self.user.email
    data[:subject] = "Friendly reminder to get in touch with your friend at " + self.email
    data[:text] = '+2 Remember to contact ' + self.email

    RestClient.post "https://api:key-56nudki43wpj6ok-ov8erennpzfbbw42"\
    "@api.mailgun.net/v2/justmet.mailgun.org/messages", data
  end
  
end
