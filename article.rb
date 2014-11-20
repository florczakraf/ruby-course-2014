require 'stamp'

class Article
  attr_reader :title, :content, :author, :likes, :dislikes, :created_at
  
  def initialize(title, content, author = '', created_at = Time.now)
    @title, @content, @author, @created_at = title, content, author, created_at
    @dislikes = @likes = 0
  end

  def like!
    @likes += 1
  end

  def dislike!
    @dislikes += 1
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
  
  def created_stamp
    @created_at.format_like("Sunday, May 1, 2000")
  end
  
  def to_s
    @title + ' | ' + @author + ' | ' + positive_votes.to_s + "\n" + shortened_to(30)    
  end
end
