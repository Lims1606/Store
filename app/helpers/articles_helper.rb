module ArticlesHelper
  def short_description(article, length = 10)
    if article.description.length > length
      truncate(article.description, length: length) + " " +
      link_to("Read more...", article_path(article))
    else
      article.description
    end
  end
end
