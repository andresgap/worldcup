class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :leaderboard_id
      t.integer :user_id

      t.timestamps
    end
  end
end
