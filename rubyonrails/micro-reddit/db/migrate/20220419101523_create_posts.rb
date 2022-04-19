class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string
      t.stringt.reference
      t.timestamps
    end
  end
end
