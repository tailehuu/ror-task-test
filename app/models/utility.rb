class Utility
  def self.create_unique_url(post)
    permalink = '/your_path/' + post.title.parameterize.to_s
    permalink += post.id.to_s unless Post.find_by_permalink(permalink).nil?
    return permalink
  end
end