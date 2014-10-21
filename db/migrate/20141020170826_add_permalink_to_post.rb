class AddPermalinkToPost < ActiveRecord::Migration
  def change
    add_column :posts, :permalink, :string
    Post.reset_column_information
    Post.all.each do |post|
      post.update_attribute(:permalink, Utility.create_unique_url(post))
    end
  end
end
