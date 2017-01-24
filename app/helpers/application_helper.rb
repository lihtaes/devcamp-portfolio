module ApplicationHelper

  def login_helper style, needs_br=false
    if current_user.is_a?(GuestUser)
      if needs_br
        (link_to "register", new_user_registration_path, class: style) + "<br>".html_safe +
        (link_to "login", new_user_session_path, class: style)
      else  
        (link_to "register", new_user_registration_path, class: style) + " ".html_safe +
        (link_to "login", new_user_session_path, class: style) 
      end
    else  
      link_to "logout", destroy_user_session_path, method: :delete, class: style  
    end 
  end

  def source_helper(layout_name)
    # Here is the follow up for the session variable code from the set_source concern in controllers/concerns
     if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: "source-greeting")
     end 
  end

  def copyright_helper
    CampbellViewTool::Renderer.copyright 'Bradley Campbell |', 'All rights reserved'
  end

  def nav_items 
    [
      {
        url: root_path,
        title: 'home'
      },
            {
        url: about_me_path,
        title: 'resume'
      },
            {
        url: portfolios_path,
        title: 'portfolio'
      },
            {
        url: contact_path,
        title: 'contact'
      },
            {
        url: blogs_path,
        title: 'blog'
      }
    ]
      
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path 
    "active" if current_page? path
  end

end




























