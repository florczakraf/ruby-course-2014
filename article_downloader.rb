require 'nokogiri'
require 'open-uri'
require 'openssl'
require_relative 'article_manager.rb'

class ArticleDownloader
  
  def self.download_articles(address = "https://zapisy.ii.uni.wroc.pl/news/?page=", page_number = '1')
    article_manager = ArticleManager.new    
    page = Nokogiri::HTML(open(address + page_number, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE} ))
    
    articles = page.css('div.od-news-item')
    articles.each do |art|
      title = art.css('h3').text
      date = Time.parse(art.css('span.od-news-date').text)
      content = art.css('div.od-news-body').text.split.join(' ')
      author = art.css('div.od-news-footer').text.split.join(' ')
      
      article = Article.new(title, content, author, date)
      article_manager.articles.push(article)
    end
    article_manager
  end
end
