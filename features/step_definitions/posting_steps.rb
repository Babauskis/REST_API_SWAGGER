Then(/^I can create a new blog post$/) do
  @blog_post = Blog_post.new('', '')
  create_blog_post_positive(@blog_post, @user)
end


And(/^I check if blog post was created$/) do
  check_blog_post_created(@blog_post, @user)
end

Then(/^I update blog title$/) do
  update_blog_title(@blog_post, @user)
end