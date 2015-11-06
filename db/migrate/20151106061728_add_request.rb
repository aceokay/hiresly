class AddRequest < ActiveRecord::Migration
  def change
    create_table(:requests) do |t|
      t.integer :problem_id
      t.integer :user_id

      t.timestamps
    end
  end
end
