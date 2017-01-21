class CreateContentRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :content_records do |t|
      t.string :kind, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
