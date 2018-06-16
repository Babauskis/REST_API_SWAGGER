require 'rest-client'
require 'date'

def create_blog_post_positive(blog_post, user)
  payload = {
    title: blog_post.title,
    content: blog_post.content
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/post',
                      headers: { 'Content-Type' => 'application/json', Authorization: user.auth_token },
                      cookies: {},
                      payload: payload)

  # Check if 200 OK is received
  assert_status_code(200, response, 'Blog post')

  response_hash = JSON.parse(response)

  blog_post.id = response_hash['id']
end

def check_blog_post_created(blog_post, user)
  response = API.get("http://195.13.194.180:8090/api/post?id=#{@blog_post.id}",
                     headers: { 'Authorization' => user.auth_token },
                     cookies: {})

  # Check if 200 OK is received
  assert_status_code(200, response, 'Blog post not exist')

  response_hash = JSON.parse(response)

  # Check if blog post id is correct
  assert_equal(blog_post.id, response_hash['id'], 'IDs does not match!')
  # Check if title match
  assert_equal(blog_post.title, response_hash['title'], 'Title does not match!')
  # Check if content match
  assert_equal(blog_post.content, response_hash['content'], 'Content does not match!')
end

def update_blog_title(blog_post, user)
  blog_post.title = "Updated title - #{DateTime.now.strftime('%Q')}"
  payload = {
    title: blog_post.title
  }.to_json

  response = API.put("http://195.13.194.180:8090/api/post?post_id=#{@blog_post.id}",
                     headers: {'Content-Type' => 'application/json', Authorization: user.auth_token },
                     cookies: {},
                     payload: payload)

  # Check if 200 OK is received
  assert_status_code(200, response, 'Update blog')

  response_hash = JSON.parse(response)

  # Check if blog post id is correct
  assert_equal(blog_post.id, response_hash['id'], 'IDs does not match!')
  # Check if title match
  assert_equal(blog_post.title, response_hash['title'], 'Title does not match!')
  # Check if content match
  assert_equal(blog_post.content, response_hash['content'], 'Content does not match!')
end