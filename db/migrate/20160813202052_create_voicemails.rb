class CreateVoicemails < ActiveRecord::Migration
  def change
    create_table :voicemails do |t|
      t.references :call, index: true, foreign_key: true
      t.string :url
      t.integer :duration

      t.timestamps null: false
    end
  end
end
