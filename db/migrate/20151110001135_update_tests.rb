class UpdateTests < ActiveRecord::Migration
  def change
    remove_column :tests, :problem, :string
    remove_column :tests, :time_completed, :datetime
  end
end
