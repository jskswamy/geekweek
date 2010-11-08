class HomeController < ApplicationController

  def welcome
    render :partial => "welcome"
  end

  def about
    render :partial => "about"
  end

end
