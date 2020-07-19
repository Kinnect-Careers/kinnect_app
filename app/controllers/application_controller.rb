class ApplicationController < ActionController::Base
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
end
