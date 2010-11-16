class Participant < ActiveRecord::Base

  validates_presence_of :name, :email, :phone, :organization, :designation
  validate :default_text

  def default_text
    errors.add(:name, "can't be blank") if name == "Your Name"
    if email == "Email"
      errors.add(:email, "can't be blank")
    elsif !email.nil?
      validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
    end
    errors.add(:phone, "can't be blank") if phone == "Contact Number"
    errors.add(:organization, "can't be blank") if organization == "Organization"
    errors.add(:designation, "can't be blank") if designation == "Your Role"
  end

end
