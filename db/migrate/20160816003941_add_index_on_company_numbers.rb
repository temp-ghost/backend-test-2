class AddIndexOnCompanyNumbers < ActiveRecord::Migration
  def change
    add_index :company_numbers, :sip_endpoint
  end
end
