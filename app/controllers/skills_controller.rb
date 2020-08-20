class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def create
    @skill = current_user.skills.build(skill_params)
    if @skill.save
      flash[:success] = "Skill Added"
      redirect_to root_url
    else
      @skill_items = current_user.skills_feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end
  
  def destroy
    @skill.destroy
    flash[:success] = "Skill deleted"
    redirect_to request.referrer || root_url
  end
  
  private
    def skill_params
      params.require(:skill).permit(
        :title, 
        :descriptor)
    end
    
    def correct_user
      @skill = current_user.skills.find_by(id: params[:id])
      redirect_to root_url if @skill.nil?
    end
    
end
