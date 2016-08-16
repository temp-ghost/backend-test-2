# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_one :user_number
  has_many :call_histories

  def self.find_by_sip_endpoint(sip_endpoint)
    UserNumber.find_by(sip_endpoint: sip_endpoint)&.user
  end

  def self.find_by_department_sip_endpoint(sip_endpoint)
    # @todo Implement logic to manage employees shifts
    CompanyNumber.find_by_sip_endpoint(sip_endpoint)&.users&.first
  end
end
