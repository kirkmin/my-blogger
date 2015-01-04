class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :articles, through: :taggings

  def to_s
    name
  end

  def article_list
    articles.map(&:title).join(", ")
  end

  def article_list=(articles_string)
    article_titles = articles_string.split(",").map {|s| s.strip.downcase}.uniq
    new_or_found_articles = article_titles.map {|name| Tag.find_or_create_by(title: title)}
    self.articles = new_or_found_tags
  end
end
