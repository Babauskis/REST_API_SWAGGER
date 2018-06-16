require 'date'

class Blog_post
  attr_accessor :id
  attr_accessor :title
  attr_accessor :content

  def initialize(title, content)
    if title == ''
      @title = 'Swagger' + DateTime.now.strftime('%Q')
    else
      return title
    end
    if content == ''
      @content = 'Content' + DateTime.now.strftime('%Q')
    else
      return content
    end
  end
end