class CreateAudibleScrapers < ActiveRecord::Migration[6.0]
  def change
    create_table :audible_scrapers do |t|

      t.timestamps
    end
  end
end
