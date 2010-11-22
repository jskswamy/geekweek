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

  def closed
    render :partial => "closed"
  end

end
