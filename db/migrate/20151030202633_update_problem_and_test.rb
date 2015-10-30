class UpdateProblemAndTest < ActiveRecord::Migration
  def change
    drop_table :problems_tests

    add_column :tests, :problem_id, :integer
  end
end
