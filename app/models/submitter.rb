class Submitter < ActiveRecord::Base

  validates_presence_of :first_name, :family_name, :address, :postcode, :email

  def full_name
    "#{first_name} #{family_name}"
  end

end
