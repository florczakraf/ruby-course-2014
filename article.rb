class Article
  def initialize(title, content, author = '')
    @title, @content, @author = title, content, author

    @dislikes = @likes = 0

    @created_at = Time.now
  end

  def like!
    @likes += 1
  end

  def dislike!
    @dislikes -= 1
  end

  def positive_votes
    @likes - @dislikes
  end

  def votes
    @likes + @dislikes
  end

  def shortened_to(limit)
    return @content if limit > @content.length
    @content[0...limit-3] + '...'
  end

  def include?(pattern)
    @content.include? pattern
  end

  def words
    @content.split(/\W+/)
  end

  def distinct_words
    words.uniq!
  end
end
