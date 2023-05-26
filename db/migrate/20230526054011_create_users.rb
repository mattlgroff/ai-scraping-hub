class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :name
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.binary :encrypted_api_key

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
