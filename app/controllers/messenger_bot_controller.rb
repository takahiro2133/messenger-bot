class MessengerBotController < ActionController::Base
    #require 'json'
    #require 'open-uri'
    #require 'uri'
  
    #BingAPIKEY = 'RWVDsTmHZY47DRyQQq4iJmvb6Ut1ENBPeRk+OdfFthY'
  def message(event,sender)
　　sender.reply(text: "hello")
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)
        payload = event["postback"]["payload"]
    case payload
    when "using_c"
      sender.reply(text: "C！")
    when "other_c"
      sender.reply(text: "otherC")
    end
  end
  
end 

