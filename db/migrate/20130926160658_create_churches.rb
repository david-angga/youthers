class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :church_name
      t.string :church_address
      t.string :church_phone
      t.string :church_city
      t.string :church_province
      t.string :youth_leader
      t.integer :youthers_count
      t.string :daerah
      t.string :wilayah
      t.boolean :address_allowed, :default => false

      t.timestamps
    end
  end
end
