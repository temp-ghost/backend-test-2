# == Schema Information
#
# Table name: user_departments
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  company_number_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_user_departments_on_company_number_id  (company_number_id)
#  index_user_departments_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_6e27db3774  (user_id => users.id)
#  fk_rails_cacd85ea2e  (company_number_id => company_numbers.id)
#

class UserDepartment < ActiveRecord::Base
  belongs_to :user
  belongs_to :company_number
end
