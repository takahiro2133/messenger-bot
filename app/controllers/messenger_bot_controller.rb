class MessengerBotController < ActionController::Base
  
    def message(event,sender)
　    　    sender.reply(text: "hello")
    end
  
 
    def delivery(event, sender)
    end
  
end 

