class AddInformationToCall < ActiveRecord::Migration
  def change
    add_column :calls, :call_uuid, :string
    add_column :calls, :duration, :integer
  end
end
