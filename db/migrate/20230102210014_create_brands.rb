class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :logo_url
    end
  end
end
