class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :img_src
      t.string :length_text_string
      t.integer :length_text_mins
      t.integer :search_id

      t.timestamps
    end
  end
end
