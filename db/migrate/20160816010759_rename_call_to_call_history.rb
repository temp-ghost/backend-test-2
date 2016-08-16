class RenameCallToCallHistory < ActiveRecord::Migration
  def change
    rename_table :calls, :call_histories
  end
end
