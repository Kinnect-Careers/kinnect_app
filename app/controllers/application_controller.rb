class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def home
    render html: "HOME"
  end
  
  def about
    render html: "ABOUT"
  end
  
  def contact
    render html: "CONTACT"
  end
  
  def faq
    render html: "FAQ"
  end
  
  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
