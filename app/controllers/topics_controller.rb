class TopicsController < ApplicationController
  before_action :topics_for_sidebar, only: [:index, :show, :edit, :new]
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.page(params[:page]).per(5)
     else
      @blogs = @topic.blogs.page(params[:page]).per(5).published
    end
  end


  private

      def topics_for_sidebar
      @topics = Topic.with_blogs
    end
end

   