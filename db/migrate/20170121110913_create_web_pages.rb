class CreateWebPages < ActiveRecord::Migration[5.0]
  def change
    create_table :web_pages do |t|
      t.string :url, null: false
      t.timestamps
    end
  end
end
