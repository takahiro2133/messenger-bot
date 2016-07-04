class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
    BingAPIKEY = 'RWVDsTmHZY47DRyQQq4iJmvb6Ut1ENBPeRk+OdfFthY'
  
  def message(event,sender)
    text = event['message']['text']
　　sender.reply(text: "hello")
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)
  end
  
end 

