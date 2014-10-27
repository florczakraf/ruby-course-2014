require_relative "../../mock_article"

class MockArticleSpec < Test::Unit::TestCase
  def setup
    @article = MockArticle.new
  end
  
  def test_random_number
    random_num = @article.random_number
    assert_equal(true, random_num >= 0 && random_num < 100)
  end
  
  def test_generate_author
    author = @article.generate_author.split
    assert_equal(2, author.length)
    author.each { |name| assert_equal(name, name.capitalize) }
  end
  
  def test_generate_title
    title = @article.generate_title.split
    assert_equal(true, title.length >= 1 && title.length <= 5)
    assert_equal(title.first, title.first.capitalize)
    2.upto(title.length - 1) { |i| assert_equal(title[i], title[i].downcase) }
  end
  
  def test_generate_sentence
    sentence = @article.generate_sentence.split
    assert_equal(true, sentence.length >= 5 && sentence.length <= 10)
    assert_equal(sentence.first, sentence.first.capitalize)
    assert_equal(".", sentence.last[sentence.last.length - 1])
    2.upto(sentence.length - 1) { |i| assert_equal(sentence[i], sentence[i].downcase) } 
  end
  
  def test_generate_content
    content = @article.generate_content
    number_of_dots = content.count(".")
    number_of_spaces_after_dots = content.scan(/\. /).length
    
    assert_equal(true, number_of_dots >= 1 && number_of_dots <= 5)
    assert_equal(1, number_of_dots - number_of_spaces_after_dots)
  end
end
