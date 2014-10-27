require_relative "../../article_manager"

class ArticleManagerSpec < Test::Unit::TestCase
  def setup
    @art1 = Article.new("Title1", "Content1", "Author1")
    @art2 = Article.new("Title2", "Content2", "Author1")
    @art3 = Article.new("Title3", "Content3", "Author2")
    
    3.times { @art1.dislike! }
    5.times { @art2.like! }
    2.times { @art3.like! }
    2.times { @art3.dislike! }
    
    @manager = ArticleManager.new
    @manager.articles.push(@art1)
    @manager.articles.push(@art2)
    @manager.articles.push(@art3)    
  end
  
  def test_best_articles
    best_arts = [@art2, @art3, @art1]
    assert_equal(best_arts, @manager.best_articles)
  end
  
  def test_worst_articles
    worst_arts = [@art1, @art3, @art2]
    assert_equal(worst_arts, @manager.worst_articles)
  end
  
  def test_worst_article
    assert_equal(@art1, @manager.worst_article)
  end
  
  def test_best_article
    assert_equal(@art2, @manager.best_article)
  end
  
  def test_most_popular_artricle
    assert_equal(@art2, @manager.most_popular_article)
  end
  
  def test_include
    assert_equal([@art3], @manager.include?("Content3"))
    assert_equal([], @manager.include?("fail test"))
  end
  
  def test_authors
    assert_equal(["Author1", "Author2"], @manager.authors)
  end
  
  def test_number_of_authors
    assert_equal(2, @manager.number_of_authors) 
  end
  
  def test_votes
    assert_equal(12, @manager.votes)
  end
  
  def test_to_s
    string = "All articles:\n"
    [@art1, @art2, @art3].each { |art| string += art.to_s + "\n\n" }
    
    assert_equal(string, @manager.to_s)
  end
end
