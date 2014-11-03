require_relative 'article'
require 'bla_bla'

class MockArticle < Article

  def initialize
    super(BlaBla.generate_title, BlaBla.generate_content, BlaBla.generate_author)
    @likes = random_number
    @dislikes = random_number
  end
  
  def random_number
    rand(100)
  end
end
