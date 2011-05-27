require "#{ENV['TM_BUNDLE_SUPPORT']}/lib/metaweblog.rb"

class WordPressClient < MetaWeblogClient
  def initialize(*args)
    super(*args)
  end
  
  # √
  def get_page(blog_id, page_id, username, password)
    call("wp.getPage", "#{blog_id}", "#{page_id}", "#{username}", "#{password}")
  end
  alias_method :getPage, :get_page
  
  # √
  def edit_page(blog_id, page_id, username, password, page, publish)
    call("wp.editPage", "#{blog_id}", "#{page_id}", "#{username}", "#{password}", page, publish)
  end
  alias_method :editPage, :edit_page
  
  # √
  def new_page(blog_id, username, password, page, publish)
    call("wp.newPage", "#{blog_id}", "#{username}", "#{password}", page, publish)
  end
  alias_method :newPage, :new_page
  
  # √
  def get_pages(blog_id, username, password, number)
    call("wp.getPages", "#{blog_id}", "#{username}", "#{password}", number)
  end
  alias_method :getPages, :get_pages
end