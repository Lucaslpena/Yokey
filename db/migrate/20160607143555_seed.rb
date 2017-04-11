class Seed < ActiveRecord::Migration
  def change

    enable_extension 'uuid-ossp'


    create_table  :users, id: :uuid,  default: "uuid_generate_v4()", force: :cascade do |t|
      #Custom Attributes
      t.integer   :state, index: true, default: 0, null: false
      t.timestamps null: false
      t.string :fb_id, index:true, null: true

      #Devise Below
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
    end

    add_index(:users,:id)
    # add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true


    create_table    :relationships do |t|
      t.uuid        :friend_one, index: true, null: false
      t.uuid        :friend_two, index: true, null: false
      t.integer     :method, index: true, null: false
      t.datetime    :created_at
    end
    add_foreign_key(:relationships, :users, column: :friend_one, primary_key: :id)
    add_foreign_key(:relationships, :users, column: :friend_two, primary_key: :id)

    create_table  :reviews, id: :uuid,  default: "uuid_generate_v4()", force: :cascade do |t|
      t.uuid      :user_id, index: true
      t.string    :emoji, index: true, null: false
      t.integer   :kind, index: true, default: 0, null: false
      t.string    :source, null: false, index: true
      t.st_point  :lonlat, geographic: true, null: false
      t.string    :loc_name, null: true
      t.string    :thumbnail, null: false
      t.string    :facebook_place_id, null: true, index: true
      t.timestamps null: false
    end
    add_foreign_key(:reviews, :users, column: :user_id, primary_key: :id)

    create_table :identities do |t|
      t.uuid   :user_id, index: true
      t.string :provider
      t.string :accesstoken
      t.string :refreshtoken
      t.string :uid
      t.string :name
      t.string :email
      t.string :nickname
      t.string :image
      t.string :phone
      t.string :urls
      t.timestamps null: false
    end
    add_foreign_key(:identities, :users, column: :user_id, primary_key: :id)
  end
end