class MailJob < Struct.new(:contact_id)
  def perform
    Rails.logger.info("Performing AttackJob")
    # get the info for that contact
    Contact.find_by_id :contact_id
    Contact.remind 
  end
end