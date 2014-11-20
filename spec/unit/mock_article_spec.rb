require_relative "../../mock_article"

class MockArticleSpec < MiniTest::Test
  def setup
    @article = MockArticle.new
  end
  
  def test_random_number
    random_num = @article.random_number
    assert_equal(true, random_num >= 0 && random_num < 100)
  end
end
