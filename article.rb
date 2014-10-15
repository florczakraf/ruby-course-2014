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


a1 = Article.new("Crime and Punishment","On an, ex an  on cepti    onally hot. evening early in July a young man came out of the garret","Fyodor Dostoevsky")
puts a1.shortened_to(22) # prints => "On an exceptionally..."
puts a1.include? "except"
puts a1.words
puts "---"
puts a1.distinct_words
gets