class Submitter < ActiveRecord::Base
  def full_name
    "#{first_name} #{family_name}"
  end
end
