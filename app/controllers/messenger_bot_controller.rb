class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
    BingAPIKEY = 'RWVDsTmHZY47DRyQQq4iJmvb6Ut1ENBPeRk+OdfFthY'
  def message(event,sender)

            if text.end_with?("天気")
                    uri = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010'
                    res = JSON.load(open(uri).read)
                    weather_today = res['forecasts'][0]
                    #weather_tomorrow = res['forecasts'][1]
                    #link = res['link']
                    city = res['location']['city']
                    weather = weather_today['telop']
                    today = "#{weather_today['dateLabel']}の#{city}の天気は「#{weather_today['telop']}」だな。"
                    
                    if weather == '晴れ'
                          sender.reply({ text: "#{today}こんな晴れた日には、でロックンロール！！" })
                    elsif weather == '曇のち雨'
                          sender.reply({ text: "#{today}こんなしみったれた日はこの曲でも聞いてロックしろ！！" })
                    elsif weather == '雨'
                          sender.reply({ text: "#{today}こんな日はこの曲でも聞いてロックしろ！！" })
                    elsif weather == '曇り'
                          recommend_sample = recommend.sample
                          sender.reply({ text: "#{today}こんな日は#{recommend_sample[0]}でも聞いてロックしろ！！" })
                    elsif weather == '曇時々雨'
                          sender.reply({ text: "#{today}こんな日はこの曲でも聞いてロックしろ！！" })
                 　  elsif weather == '曇時々晴'
                      　　sender.reply({ text: "#{today}"})
                    else  sender.reply( text: "天気なんか知るか" )
                    end

          　else 
          　      sender.reply(text: "hello")
            end
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)

  end
  
end 

