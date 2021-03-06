module ApplicationHelper
  def flash_errors
    if flash[:errors]
      flash[:errors].map { |error| "#{error}" }.join("<br>").html_safe
    end
  end

  def vote_button(action_url, button_text)
    <<-HTML.html_safe
      <form action="#{action_url}" method="post">
        #{form_auth_token}
        <button>#{button_text}</button>
      </form>
    HTML
  end

  def flash_notices
    if flash[:notice]
      "#{flash[:notice]}<br><br>".html_safe
    end
  end

  def form_auth_token
    <<-HTML.html_safe
      <input type="hidden"
             name="authenticity_token"
             value="#{form_authenticity_token}">
    HTML
  end

  def formatted_date(updated_at)
    "#{(updated_at.to_date - Time.now.to_date).to_i} days ago"
  end

  def user_heading
    if logged_in?
      delete_button(session_url, "Log out")
    else
      html = "<a href=\"#{new_session_url}\">Log in</a>".html_safe
      html += "<br>".html_safe
      html += "<a href=\"#{new_user_url}\">Register</a>".html_safe
      html
    end
  end

  def delete_button(action_url, button_text)
    <<-HTML.html_safe
    <form action="#{action_url}" method="post">
      #{form_auth_token}
      <input type="hidden" name="_method" value="delete">
      <button>#{button_text}</button>
    </form>
    HTML
  end
end
