# == Schema Information
#
# Table name: voicemails
#
#  id              :integer          not null, primary key
#  call_history_id :integer
#  url             :string
#  duration        :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_voicemails_on_call_history_id  (call_history_id)
#
# Foreign Keys
#
#  fk_rails_54e13284b6  (call_history_id => call_histories.id)
#

class Voicemail < ActiveRecord::Base
  belongs_to :call_history

  validates :call_history, presence: true
end
