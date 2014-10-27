require_relative 'article'

class ArticleFilesystem
  ARTICLES_FOLDER = "articles/"
  
  def self.write_to_file(article)
    name = article.title.downcase.split.join('_')
    
    File.open(ARTICLES_FOLDER + name, 'w') do |file|
      file.write(article.author + "|" + article.title + "|" + article.content)
      file.write("|" + article.likes.to_s + "|" << article.dislikes.to_s)
    end
  end
  
  def self.read_from_file(path)
    file = File.open(path, 'r')
    line = file.first.split("|")
    file.close
    
    art = Article.new(line[1], line[2], line[0])
    likes = line[3].to_i
    dislikes = line[4].to_i
    likes.times { art.like! }
    dislikes.times { art.dislike! }
    art
  end
end