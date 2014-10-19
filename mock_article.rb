require_relative 'article'

class MockArticle < Article

  WORD_LIST = [
    'lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing', 
    'elit', 'morbi', 'feugiat', 'consequat', 'neque', 'commodo', 'accumsan',
    'posuere', 'aliquam', 'non', 'scelerisque'
  ]
  
  def initialize
    super(generate_title, generate_content, generate_author)
    @likes = random_number
    @dislikes = random_number
  end
  
  def random_number
    rand(100)
  end
  
  def generate_author
    WORD_LIST.sample.capitalize + ' ' + WORD_LIST.sample.capitalize
  end
  
  def generate_title
    WORD_LIST.sample(rand(5) + 1).join(' ').capitalize
  end
  
  def generate_sentence
    WORD_LIST.sample(rand(6) + 5).join(' ').capitalize + '.'
  end
  
  def generate_content
    content = ''
    (rand(5) + 1).times { content += generate_sentence + ' ' }
    content[0...-1]
  end
end
