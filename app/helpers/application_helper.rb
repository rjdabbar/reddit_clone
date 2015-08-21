module ApplicationHelper
  def form_auth_token
    <<-HTML.html_safe
      <input type="hidden"
             name="authenticity_token"
             value="#{form_authenticity_token}">
    HTML
  end

  def user_heading
    if logged_in?
      delete_button(session_url, "Log out")
    else
      "<a href=\"#{new_session_url}\">Log in</a>".html_safe
      "<a href=\"#{new_user_url}\">Register</a>".html_safe
    end
  end

  def delete_button(action_url, button_text)
    <<-HTML.html_safe
    <form action="#{action_url}" method="post">
      <input type="hidden" name="_method" value="delete">
      <button>#{button_text}</button>
    </form>
    HTML
  end
end
