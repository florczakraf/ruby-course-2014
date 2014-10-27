class ArticleFilesystem
  ARTICLES_FOLDER = "articles/"
  
  def self.write_to_file(article)
    name = article.title.downcase.split.join('_')
    
    File.open(ARTICLES_FOLDER + name, 'w') do |file|
      file.write(article.author + "|" + article.title + "|" + article.content)
      file.write("|" + article.likes.to_s + "|" << article.dislikes.to_s)
    end
  end
end