class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.string :name
      t.boolean :share, default: false

      t.timestamps
    end
  end
end
