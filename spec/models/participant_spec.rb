require 'spec_helper'

describe Participant do

  it "should not create participant without name" do
    participant = Factory.build(:participant, :name => nil)
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Name can't be blank"
  end

  it "should not create participant without email" do
    participant = Factory.build(:participant, :email => nil)
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Email can't be blank"
  end

  it "should not create participant without phone" do
    participant = Factory.build(:participant, :phone => nil)
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Phone can't be blank"
  end

  it "should not create participant without organization" do
    participant = Factory.build(:participant, :organization => nil)
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Organization can't be blank"
  end

  it "should not create participant without designation" do
    participant = Factory.build(:participant, :designation => nil)
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Designation can't be blank"
  end

  it "should not create participant if the name is 'Your Name'" do
    participant = Factory.build(:participant, :name => "Your Name")
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Name can't be blank"
  end

  it "should not create participant if the email is 'Email'" do
    participant = Factory.build(:participant, :email => "Email")
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Email can't be blank"
  end

  it "should not create participant if the phone is 'Phone'" do
    participant = Factory.build(:participant, :phone => "Contact Number")
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Phone can't be blank"
  end

  it "should not create participant if the organization is 'Organization'" do
    participant = Factory.build(:participant, :organization => "Organization")
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Organization can't be blank"
  end

  it "should not create participant if the designation is 'Your Role'" do
    participant = Factory.build(:participant, :designation => "Your Role")
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Designation can't be blank"
  end

  it "should not creare participant with invalid email" do
    participant = Factory.build(:participant, :email => "Some Email")
    participant.valid?.should == false
    participant.errors.full_messages.to_sentence.should == "Email is invalid"
  end

end
