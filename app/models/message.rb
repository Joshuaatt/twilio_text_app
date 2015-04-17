class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
  response = RestClient::Request.new(
    :method => :post,
    :url => 'https://api.twilio.com/2010-04-01/Accounts/ACf495d7df7d60e0e81643faf58b1b9d74/Messages.json',
    :user => ENV['TWILIO_ACCOUNT_SID'],
    :password => ENV['TWILIO_AUTH_TOKEN'],
    :payload => { :Body => body,
                  :From => from,
                  :To => to }).execute
  end
end
