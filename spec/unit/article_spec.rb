require_relative "../../article"
require 'date'

class ArticleSpec < Test::Unit::TestCase
  def setup
    @article = Article.new("Title", "Content Content", "Author")
  end
  
  def test_initialize
    assert_equal("Title", @article.title)
    assert_equal("Content Content", @article.content)
    assert_equal("Author", @article.author)
    assert_equal(0, @article.likes)
    assert_equal(0, @article.dislikes)
  end
  
  def test_like
    likes = @article.likes
    assert_equal(likes + 1, @article.like!)
  end
  
  def test_dislike
    dislikes = @article.dislikes
    assert_equal(dislikes + 1, @article.dislike!)
  end
  
  def test_positive_votes
    positive_votes = @article.likes - @article.dislikes
    assert_equal(positive_votes, @article.positive_votes)
  end
  
  def test_votes
    votes = @article.likes + @article.dislikes
    assert_equal(votes, @article.votes)
  end
  
  def test_shortened_to
    assert_equal("Co...", @article.shortened_to(5))
    assert_equal("Content Content", @article.shortened_to(50))
  end
  
  def test_include
    assert_equal(true, @article.include?("ont"))
    assert_equal(false, @article.include?("test"))
  end
  
  def test_words
    assert_equal(["Content", "Content"], @article.words)
  end
  
  def test_distinct_words
    assert_equal(["Content"], @article.distinct_words) 
  end
  
  def test_created_stamp
    created_stamp = @article.created_at.stamp("Sunday, May 1, 2000")
    assert_equal(created_stamp, @article.created_stamp)
  end
  
  def test_to_s
    string = @article.title + ' | ' + @article.author + ' | ' + @article.positive_votes.to_s + "\n" + @article.shortened_to(30)
    assert_equal(string, @article.to_s)
  end
end
