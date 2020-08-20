class ExperiencesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  
  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      flash[:success] = "Experience Added"
      redirect_to root_url
    else
      @experience_items = current_user.experiences_feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end
  
  def destroy
    @experience.destroy
    flash[:success] = "Experience deleted"
    redirect_to request.referrer || root_url
  end
  
  private
    def experience_params
      params.require(:experience).permit(
        :company, 
        :started_at, 
        :ended_at, 
        :roles)
    end
    
    def correct_user
      @experience = current_user.experiences.find_by(id: params[:id])
      redirect_to root_url if @experience.nil?
    end
end
