class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
  def message(event,sender)
      text = event['message']['text']
           if text == "天気"
                    uri = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010'
                    res = JSON.load(open(uri).read)
                    weather_today = res['forecasts'][0]
                    city = res['location']['city']
                    weather = weather_today['telop']
                    today = "#{weather_today['dateLabel']}の#{city}の天気は「#{weather_today['telop']}」だな。"
                    
                    if weather == "晴れ"
                          sender.reply({ text: "#{today}こんな晴れた日には、でロックンロール！！" })
                    elsif weather == "曇のち雨"
                          sender.reply({ text: "#{today}こんなしみったれた日はこの曲でも聞いてロックしろ！！" })
                    elsif weather == "雨"
                          sender.reply({ text: "#{today}こんな日はこの曲でも聞いてロックしろ！！" })
                    elsif weather == "曇り"
                          sender.reply({ text: "#{today}こんな日はでも聞いてロックしろ！！" })
                    elsif weather == "曇時々雨"
                          sender.reply({ text: "#{today}こんな日はこの曲でも聞いてロックしろ！！" })
                 　  elsif weather == "曇時々晴"
                      　　sender.reply({ text: "#{today}"})
                    else  
                      sender.reply( text: "天気なんか知るか" )
                    end
#奏法などに対する応答
            elsif text.include?("アルペジオ") && text.end_with?("？") or text == ("アルペジオ")
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

