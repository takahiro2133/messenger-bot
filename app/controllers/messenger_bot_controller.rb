class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
    BingAPIKEY = 'RWVDsTmHZY47DRyQQq4iJmvb6Ut1ENBPeRk+OdfFthY'
  def message(event,sender)
    　text = event['message']['text']
#コード
      text_C  = 'http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png'
      text_G  = 'http://mfc-music.com/wp-content/uploads/2015/03/G%E3%82%B3%E3%83%BC%E3%83%89.png'
      text_Am = 'http://mfc-music.com/wp-content/uploads/2015/03/Am%E3%82%B3%E3%83%BC%E3%83%89.png'

    
    #コード音
      text_C_music = 'https://www.dropbox.com/home?preview=C%E3%82%B3%E3%83%BC%E3%83%89.mp3'

            if text.end_with?("天気")
                    uri = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010'
                    res = JSON.load(open(uri).read)
                    weather_today = res['forecasts'][0]
                    weather_tomorrow = res['forecasts'][1]
                    link = res['link']
                    city = res['location']['city']
                    weather = weather_today['telop']
            
                    if weather_today['temperature']['max'] != nil
                        max = "最高気温：#{weather_today['temperature']['max']['celsius']}℃"
                    end
                    if weather_today['temperature']['min'] != nil
                        min = "最低気温：#{weather_today['temperature']['min']['celsius']}℃"
                    end
                    
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

          　else sender.reply(text: "hello")
            end
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)
    text_C  = 'http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png'
    text_G  = 'http://mfc-music.com/wp-content/uploads/2015/03/G%E3%82%B3%E3%83%BC%E3%83%89.png'
    text_Am = 'http://mfc-music.com/wp-content/uploads/2015/03/Am%E3%82%B3%E3%83%BC%E3%83%89.png'
    
    
    text_C_music = 'https://www.dropbox.com/home?preview=C%E3%82%B3%E3%83%BC%E3%83%89.mp3'
    
    payload = event["postback"]["payload"]
      case payload
      when "using_c"
          sender.reply(text: "C！")
      when "other_c"
          sender.reply(text: "otherC")
      when "music_c"
          sender.reply(text:text_C_music)
      
      when "using_A"
          sender.reply(text: "A！")
      when "other_A"
          sender.reply(text: "otherA")
      when "music_A"
          sender.reply(text: "aaa")
      
      when "using_g"
          sender.reply(text: "G！")
      when "other_g"
          sender.reply(text: "otherG")
      when "music_g"
          sender.reply(text: "はは")
      
      when "using_Am"
          sender.reply(text: "Am！")
      when "other_Am"
          sender.reply(text: "otherAm")
      when "music_Am"
          sender.reply(text: "Am")
      end

  end
  
end 

