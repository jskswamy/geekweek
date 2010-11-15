class HomeController < ApplicationController

  def welcome
    render :partial => "welcome"
  end

  def about
    render :partial => "about"
  end

  def venue
    render :partial => "venue"
  end

  def contact
    render :partial => "contact"
  end

end
