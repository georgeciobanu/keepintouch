class MailJob < Struct.new(:contact_id)
  def perform
    Rails.logger.info("Performing AttackJob")
    # get the info for that contact
    c = Contact.find contact_id
    Rails.logger.info  c
    c.remind
  end
end