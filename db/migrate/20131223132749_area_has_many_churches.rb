class AreaHasManyChurches < ActiveRecord::Migration
  def change
    add_column :churches, :area_id, :integer
    add_index :churches, :area_id
  end
end
