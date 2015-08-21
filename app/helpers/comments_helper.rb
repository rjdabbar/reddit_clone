module CommentsHelper
  def comment_nav(comment)
    html = "<a href=\"#{post_url(comment.post)}\">View Post</a>"
    unless comment.parent_comment_id.nil?
      html += "<br><a href=\"#{post_comment_url(comment.post, comment.parent_comment_id)}\">View Parent Comment</a>"
    end
    html.html_safe
  end
end
