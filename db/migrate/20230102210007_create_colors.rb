class CreateColors < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :hex, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
