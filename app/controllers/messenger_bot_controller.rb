class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
  def message(event,sender)
        sender.reply(text: "hello")
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)

  end
  
end 

