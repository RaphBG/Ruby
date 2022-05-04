class DeletingResumeFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :resume
  end
end
