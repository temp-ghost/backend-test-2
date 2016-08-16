# == Schema Information
#
# Table name: calls
#
#  id                :integer          not null, primary key
#  user_number_id    :integer
#  company_number_id :integer
#  call_time         :integer
#  voicemail         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
