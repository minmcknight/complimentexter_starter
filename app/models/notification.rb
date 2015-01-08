require 'twilio-ruby'

class Notification
  attr_accessor :to_number


  def initialize(to_number)
    @to_number = to_number
    account_sid = ENV["twilio_sid"]
    auth_token =  ENV["twilio_token"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def text
    @client.account.sms.messages.create(
      :from => "#{ENV["twilio_phone_number"]}",
      :to => @to_number,
      :body => random_compliment)
  end

  def random_compliment
    compliments = ["Great Job", "You're Awesome", "You look nice", "Nice Shoes", "You are a super coder", "Can I be your friend?"]
    compliments.sample
  end
end