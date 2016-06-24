class MessengerBotController < ActionController::Base

  def message(event,sender)
    text = event['message']['text']
             if text == "こんにちは"
         　      　sender.reply(text: "hello!")
             elsif text == "cコード"
                 sender.reply(text: "ド")
             end

  end
  
 
  def delivery(event, sender)
  end     
  
  
  def postback(event, sender)
    payload = event["postback"]["payload"]
    case payload
    when "using_Ccord"
      sender.reply(text: "C！")
    when "other_c"
      sender.reply(text: "otherC")
    when "music_c"
      sender.reply(text: "music")
    end
  end
end 
