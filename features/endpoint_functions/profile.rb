require 'rest-client'

def check_profile_info(user)
  response = API.get('http://195.13.194.180:8090/api/profile',
                     headers: { authorization: user.auth_token },
                     cookies: {})

  # Check if 200 OK is received
  assert_status_code(200, response, "Profile check")

  response_hash = JSON.parse(response)

  # Check if id is correct
  assert_equal(user.id, response_hash['id'], 'IDs does not match!')
  # Check if email is correct
  assert_equal(user.email, response_hash['email'], 'Email name is not correct!')
  # Check if first name is correct
  assert_equal(user.firstName, response_hash['firstName'], 'First name is not correct!')
end