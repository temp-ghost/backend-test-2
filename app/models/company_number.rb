# == Schema Information
#
# Table name: company_numbers
#
#  id           :integer          not null, primary key
#  sip_endpoint :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_company_numbers_on_sip_endpoint  (sip_endpoint)
#

class CompanyNumber < ActiveRecord::Base
  has_many :user_departments
  has_many :users, through: :user_departments
end
