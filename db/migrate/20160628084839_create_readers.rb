class CreateReaders < ActiveRecord::Migration
  def change

    create_table :readers, id: :uuid,  default: "uuid_generate_v4()", force: :cascade do |t|
      t.string :from_id, index: true, null: false
      t.json   :preferences
      t.timestamps null: false
    end

  end
end
