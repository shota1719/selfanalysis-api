class DeviseTokenAuthCreatePatients < ActiveRecord::Migration[6.1]
  def change
    
    create_table(:patients) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.date :birthday, :null => false
      t.integer :sex, :null => false
      t.string :image
      t.string :email, :null => false
      t.string :telphone_number, :null => false
      t.string :emergency_contact
      t.string :post_code, :null => false
      t.string :adress, :null => false
      t.string :password, :null => false

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :patients, :email,                unique: true
    add_index :patients, [:uid, :provider],     unique: true
    add_index :patients, :reset_password_token, unique: true
    add_index :patients, :confirmation_token,   unique: true
    # add_index :patients, :unlock_token,         unique: true
  end
end
