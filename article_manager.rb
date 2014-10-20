require_relative 'article'

class ArticleManager
  attr_accessor :articles

  def initialize
    @articles = []
  end
  
  def best_articles
    check_size
    @articles.sort { |art1, art2| art2.positive_votes <=> art1.positive_votes }
  end

  def worst_articles
    check_size
    @articles.sort { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end
  
  def worst_article
    check_size
    aux = @articles[0]
    @articles.each { |art| aux = art if art.positive_votes < aux.positive_votes }
    aux
  end
  
  def best_article
    check_size
    aux = @articles[0]
    @articles.each { |art| aux = art if art.positive_votes > aux.positive_votes }
    aux
  end
  
  def most_popular_article
    check_size
    aux = @articles[0]
    @articles.each { |art| aux = art if art.votes > aux.votes }
    aux
  end
  
  def include?(pattern)
    check_size
    @articles.find_all { |art| art.include? pattern }
  end
  
  def authors
    check_size
    @articles.collect { |art| art.author }.uniq!
  end
  
  def number_of_authors
    authors.size
  end

  def votes
    check_size
    @articles.inject(0) { |acc, art| acc + art.votes }
  end
  
  def to_s
    check_size
    aux = "All articles:\n"
    @articles.each { |art| aux += art.to_s + "\n\n" }
    aux
  end
  
  protected
  
  def check_size
    raise if @articles.size == 0
  end
  
end