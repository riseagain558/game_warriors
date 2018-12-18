class AddIsOnlineToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :is_online, :boolean
  end
end
