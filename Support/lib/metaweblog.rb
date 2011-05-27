require 'xmlrpc/client'
require "net/https" # OpenSSL::SSL::VERIFY_NONE

class MetaWeblogClient < XMLRPC::Client
  def initialize(*args)
    super(*args)
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE # squelch Net::HTTP warning
    self.http_header_extra = { "User-Agent" => "TextMate/Blogging Bundle (Mac OS X; http://macromates.com/blog/archives/2006/06/19/blogging-from-textmate/)" }
  end
  def get_post(post_id, username, password)
    call("metaWeblog.getPost", "#{post_id}", "#{username}", "#{password}")
  end
  alias_method :getPost, :get_post
  
  def edit_post(post_id, username, password, post, publish)
    call("metaWeblog.editPost", "#{post_id}", "#{username}", "#{password}", post, publish)
  end
  alias_method :editPost, :edit_post
  
  def new_post(blog_id, username, password, post, publish)
    call("metaWeblog.newPost", "#{blog_id}", "#{username}", "#{password}", post, publish)
  end
  alias_method :newPost, :new_post
  
  def get_recent_posts(blog_id, username, password, number)
    call("metaWeblog.getRecentPosts", "#{blog_id}", "#{username}", "#{password}", number)
  end
  alias_method :getRecentPosts, :get_recent_posts
  
  def new_media_object(blog_id, username, password, data)
    call("metaWeblog.newMediaObject", "#{blog_id}", "#{username}", "#{password}", data)
  end
  alias_method :newMediaObject, :new_media_object
end
