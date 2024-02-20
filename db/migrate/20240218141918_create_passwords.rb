class CreatePasswords < ActiveRecord::Migration[7.1]
  def change
    create_table :passwords do |t|
      t.string :content

      t.timestamps
    end
  end
end
