class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
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

      # Hiresly Specific Attributes
      t.boolean    :admin
      t.boolean    :employer
      t.boolean    :developer
      t.string     :name
      t.string     :address
      t.string     :linkedin
      t.string     :github
      t.string     :website
      t.references :interested_user, index: true

      t.timestamps null: false
    end

    create_table(:problems) do |t|
      t.string  :title
      t.string  :body
      t.integer :difficulty
      t.integer :user_id

      t.timestamps
    end

    create_table(:tests) do |t|
      t.string    :problem
      t.string    :answer_text
      t.string    :video_url
      t.string    :github_url
      t.datetime  :time_completed
      t.integer   :user_id

      t.timestamps
    end

    create_table :problems_tests, id: false do |t|
      t.belongs_to :problem, index: true
      t.belongs_to :test, index: true
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
