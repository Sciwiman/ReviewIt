class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :subscription_user_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
