class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
  BingAPIKEY = 'RWVDsTmHZY47DRyQQq4iJmvb6Ut1ENBPeRk+OdfFthY'
  
  def message(event,sender)
    text_C  = 'http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png'
    text_G  = 'http://mfc-music.com/wp-content/uploads/2015/03/G%E3%82%B3%E3%83%BC%E3%83%89.png'
    text_Am = 'http://mfc-music.com/wp-content/uploads/2015/03/Am%E3%82%B3%E3%83%BC%E3%83%89.png'
    
    
    text_C_music = 'https://www.dropbox.com/home?preview=C%E3%82%B3%E3%83%BC%E3%83%89.mp3'
    text = event['message']['text']
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
                          sender.reply({ text: "#{today}今日におすすめの曲はこれだ！！" })
                    elsif weather == '曇のち雨'
                          sender.reply({ text: "#{today}こんなしれった日はこの曲でも聞いてロックしろ！！" })
                          
                    else  sender.reply( text: "天気なんか知るか" )
                    end
                    
            elsif text == "こんにちは"
               sender.reply(text: "hello")
               
            #奏法などに対する応答
            elsif text.include?("アルペジオ") && text.end_with?("？") or text == ("アルペジオ")
              sender.reply(text: "アルペジオは、1本1本の弦をバラバラに弾く奏法のことだな！")
              sender.reply({ "attachment": {
              "type": "web_url",
              "payload": {
                 "url": "https://www.dropbox.com/home?preview=C%E3%82%B3%E3%83%BC%E3%83%89.mp3"
                          }
                                              }
                           })
            elsif text.include?("チョーキング") && text.end_with?("？") or text == ("チョーキング")
               sender.reply(text: "チョーキングは、弦を弾いた後、押し弦を動かして音の高さを変える奏法のことだな！")
              # sender.reply({ "attachment": {
              #  "type": "image",
              #  "payload": {
              #    "url": "http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png"
              #            }
              #                                }
              #              })
            
            
            #気分などに対する応答                
            elsif text.include?("疲れた") or text.include?("しんどい")
               sender.reply(text: "今の君はDmな気分なんだな！！")
               sender.reply(text:text_C_music)
               
               
            #コードに対する応答               
            elsif text == "Cコード" or text == "cコード"
               sender.reply({ "attachment":{
                 "type":"template",
                         "payload":{
                             "template_type":"generic",
                             "elements":[
                               {  "title":"Cコードの押さえ方",
                                  "image_url":text_C,
                                  "buttons":[
                                       {
                                           "type":"postback",
                                           "title":"Cコードを使ったコード進行",
                                           "payload":"using_c"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"Cの関連コード",
                                           "payload":"other_c"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"Cコードのサンプル音",
                                           "payload":"music_c"
                                       }
                                            ]
                              }
                                ]       
                                   }
                                 }
                             })
                             
              elsif text == "Gコード" or text == "gコード"
               sender.reply({ "attachment":{
                 "type":"template",
                         "payload":{
                             "template_type":"generic",
                             "elements":[
                               {  "title":"Gコードの押さえ方",
                                  "image_url":text_G,
                                  "buttons":[
                                       {
                                           "type":"postback",
                                           "title":"Gコードを使ったコード進行",
                                           "payload":"using_g"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"Gの関連コード",
                                           "payload":"other_g"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"Gコードのサンプル音",
                                           "payload":"music_g"
                                       }
                                            ]
                              }
                                ]       
                                   }
                                 }
                             })
            else sender.reply(text: "#{text}")
             
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
      
    when "using_g"
      sender.reply(text: "G！")
    when "other_g"
      sender.reply(text: "otherG")
    when "music_g"
      sender.reply(text: "はは")
    end
  end
  
end 

