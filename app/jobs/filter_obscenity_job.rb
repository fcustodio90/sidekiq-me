class FilterObscenityJob < ApplicationJob
  def perform(post_id)
    post = Post.find(post_id)
    post.name = sanitize(post.name)
    post.title = sanitize(post.title)
    post.content = sanitize(post.content)
    post.save!
  end

  private

  BLACKLIST = {
    "poop" => "candy",
    "python" => "ruby"
  }

  def sanitize(str)
    BLACKLIST.each do |bad, good|
      str.gsub!(bad, good)
    end
    str
  end
end