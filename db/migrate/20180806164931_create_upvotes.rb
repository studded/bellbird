class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.belongs_to :alarm
      t.integer :positive

      t.timestamps
    end
  end
end
