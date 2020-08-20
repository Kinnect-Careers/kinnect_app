class StaticPagesController < ApplicationController
  def contact
  end

  def faq
  end

  def about
  end
  
  def home
    if logged_in?
      @skill = current_user.skills.build
      @skill_items = current_user.skills_feed.paginate(page: params[:page], per_page: 5)
      @experience = current_user.experiences.build
      @experience_items = current_user.experiences_feed.paginate(page: params[:page], per_page: 5)
    end
  end
  
  def help
  end
  
end
