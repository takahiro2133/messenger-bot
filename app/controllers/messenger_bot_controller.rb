class MessengerBotController < ActionController::Base
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
      when "music_c"
        sender.reply(text:text_C_music)

      end
    end
  
end 

