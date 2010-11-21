require 'csv'

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

  def index
    @participants = Participant.all(:order => "created_at DESC")
  end

  def export
    @participant = Participant.all(:order => "name, organization")
    csv_string = CSV.generate do |csv|
      csv << ["Name", "Role", "Organization", "Phone", "Email"]
      @participant.each do |participant|
        csv << [participant.name, participant.role, participant.organization, participant.phone, participant.email]
      end
    end
    send_data(csv_string,
              :type => "text/csv; charset=utf-8; header=present",
              :filename => "geekweekend_participants.csv")
  end

end
