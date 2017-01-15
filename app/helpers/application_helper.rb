module ApplicationHelper

  def login_helper
    if current_user.is_a?(User) 
      link_to "logout", destroy_user_session_path, method: :delete 
    else 
      (link_to "register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "login", new_user_session_path) 
    end 
  end

  def source_helper(layout_name)
    # Here is the follow up for the session variable code from the set_source concern in controllers/concerns
     if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
     end 
  end

  

end
