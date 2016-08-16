class AddIndexOnCallUuid < ActiveRecord::Migration
  def change
    add_index :calls, :call_uuid
  end
end
