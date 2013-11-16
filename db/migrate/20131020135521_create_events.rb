class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_short_desc
      t.text :event_desc 
      t.datetime :event_date
      t.attachment :event_picture
      t.boolean :is_share
      t.string :event_pic
      t.string :event_pic_phone
      t.timestamps
    end
  end
end
