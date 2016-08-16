class AddDefaultDurationToCallHistories < ActiveRecord::Migration
  def change
    change_column :call_histories, :duration, :integer, default: 0, null: false
  end
end
