class User
  attr_accessor :id
  attr_accessor :email
  attr_accessor :firstName
  attr_accessor :lastName
  attr_accessor :password
  attr_accessor :auth_token

  def initialize(email, password)
    self.email = email
    self.password = password
  end
end