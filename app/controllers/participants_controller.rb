class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
    render :partial => "form"
  end

  def create
    @participant = Participant.create(params[:participant])
    if @participant.valid?
      render :partial => "success"
    else
      render :partial => "form"
    end
  end

end