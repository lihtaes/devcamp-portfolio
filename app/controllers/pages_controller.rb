class PagesController < ApplicationController
  def home
    @page_title = 'My Website'
    @posts = Blog.all

    @skills = Skill.all


  end

  def about
  end

  def contact
  end
end
