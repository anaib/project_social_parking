class CreatePrivateParkings < ActiveRecord::Migration
  def change
    create_table :private_parkings do |t|
      t.integer :offeree_user_id
      t.integer :acceptee_user_id
      t.datetime :date_avail
      t.time :time

      t.timestamps

    end
  end
end
