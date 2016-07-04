class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
  def message(event,sender)
#奏法などに対する応答
            if text.include?("アルペジオ") && text.end_with?("？") or text == ("アルペジオ")
              sender.reply(text: "アルペジオは、1本1本の弦をバラバラに弾く奏法のことだな！")
            else
              sender.reply(text: "hello")
            end
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)

  end
  
end 

