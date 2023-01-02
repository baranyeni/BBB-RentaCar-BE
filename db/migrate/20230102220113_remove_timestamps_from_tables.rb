class RemoveTimestampsFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :created_at, :datetime
    remove_column :locations, :updated_at, :datetime
    remove_column :car_pictures, :created_at, :datetime
    remove_column :car_pictures, :updated_at, :datetime
    remove_column :colors, :created_at, :datetime
    remove_column :colors, :updated_at, :datetime
    remove_column :brands, :created_at, :datetime
    remove_column :brands, :updated_at, :datetime
  end
end
