require 'test_helper'
require 'byebug'


class FilterObscenityJobTest < ActiveJob::TestCase
  test 'it removes bad language' do
    post = Post.create!(name: 'python sucks')

    job = FilterObscenityJob.new
    job.perform(post.id)

    post.reload

    assert_equal "ruby sucks", post.name
  end
end