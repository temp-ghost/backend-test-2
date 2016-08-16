class UpdateVoicemailRowName < ActiveRecord::Migration
  def change
    rename_column :voicemails, :call_id, :call_history_id
  end
end
