require "spec_helper"

describe Message do
  it "doesn't save a message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '5032784269')
    message.save.should be_false
  end
end
