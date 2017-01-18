module ApplicationHelper

  def login_helper
    if current_user.is_a?(GuestUser) 
      (link_to "register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "login", new_user_session_path) 
    else  
      link_to "logout", destroy_user_session_path, method: :delete  
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
    CampbellViewTool::Renderer.copyright 'Bradley Campbell', 'All rights reserved'
  end

  def get_highest_skill
    @skills = Skill.all
    @highest = MySkillTool::SkillGrabber.highest @skills
  end

end

module MySkillTool
  class SkillGrabber
    
    def self.highest skills
      sorted = skills.sort_by{|pu| pu[:percent_utilized]}
      the_one = sorted.last
    end
  end
end