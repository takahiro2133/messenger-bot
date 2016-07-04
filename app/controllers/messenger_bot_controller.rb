class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
    BingAPIKEY = 'RWVDsTmHZY47DRyQQq4iJmvb6Ut1ENBPeRk+OdfFthY'
  
  def message(event,sender)
　　sender.reply(text: "hello")
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)
  end
  
end 

