class AddRecordToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lifetime_wins, :integer, default: 0
    add_column :users, :lifetime_losses, :integer, default: 0
  end
end
