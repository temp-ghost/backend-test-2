class AddDefaultDurationToVoicemail < ActiveRecord::Migration
  def change
    change_column :voicemails, :duration, :integer, default: 0, null: false
  end
end
