module ArticlesHelper
  def short_description(description, path, length = 10)
    if description.length > length
      truncate(description, length: length) + " " +
      link_to("Read more...", path)
    else
      description
    end
  end
end
