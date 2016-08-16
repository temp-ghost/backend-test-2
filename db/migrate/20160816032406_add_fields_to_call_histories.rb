class AddFieldsToCallHistories < ActiveRecord::Migration
  def change
    add_column :call_histories, :customer_sip_endpoint, :string
    add_column :call_histories, :call_status, :integer
  end
end
