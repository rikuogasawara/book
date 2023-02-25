class CreateProfileimages < ActiveRecord::Migration[6.1]
  def change
    create_table :profileimages do |t|

      t.timestamps
    end
  end
end
