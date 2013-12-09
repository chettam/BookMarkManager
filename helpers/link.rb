module Helpers
  def add_link(url,title,tags)
    Link.create(url: url,title: title, tags: tags)
  end
end