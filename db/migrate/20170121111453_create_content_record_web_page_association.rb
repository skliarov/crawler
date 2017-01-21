class CreateContentRecordWebPageAssociation < ActiveRecord::Migration[5.0]
  def change
    add_column :content_records, :web_page_id, :integer
    add_index :content_records, :web_page_id
  end
end
