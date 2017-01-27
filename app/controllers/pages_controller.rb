class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @instagram = SocialTool.instagram_search
  end

  def contact
    
  end

  def tech_news
    @tweets = SocialTool.twitter_search
    @instagram = SocialTool.instagram_search
  end
end
