# == Schema Information
#
# Table name: call_histories
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  call_uuid             :string
#  duration              :integer          default(0), not null
#  customer_sip_endpoint :string
#  call_status           :integer
#
# Indexes
#
#  index_call_histories_on_call_uuid  (call_uuid)
#  index_call_histories_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_8e1b2ecfdf  (user_id => users.id)
#

class CallHistory < ActiveRecord::Base
  belongs_to :user
  has_one :voicemail

  validates :user, presence: true

  enum call_status: [:answer, :voicemail, :cancel]
end
