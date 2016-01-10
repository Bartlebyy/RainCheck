class StaticPagesController < ApplicationController
  def home
    # params.merge!({ From: "11234567890", Body: "30306" }) #for testing purposes

    @reply = if params[:From]
               twiml = Twilio::TwiML::Response.new do |r|
                 r.Message Text.new(params[:From], params[:Body]).run
               end
               twiml.text
             else
               'Thanks for visiting us online! Buh-bye now!'
             end
  end
end
