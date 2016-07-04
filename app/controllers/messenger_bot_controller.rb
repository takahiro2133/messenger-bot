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
    text_F = ''
    text_A = 'https://www.dropbox.com/s/ftzz61c7wvuoxw7/a3-s.png?dl=0'
    text_B = ''
    text_E = ''
    text_D = ''
    text_Fsm = ''
    text_Am = 'http://mfc-music.com/wp-content/uploads/2015/03/Am%E3%82%B3%E3%83%BC%E3%83%89.png'
    text_Em = ''
    text_Bm = ''
    text_code_all = ''
    
    #コード音
    text_C_music = 'https://www.dropbox.com/home?preview=C%E3%82%B3%E3%83%BC%E3%83%89.mp3'
  
    
    code = Array.new
    0.upto(6){|t|
      code[t] = [code_shinkou[t],code_shinkou_music[t]]
     }
    
    recommend =Array.new
      0.upto(6){|t|
      recommend[t] = [music_recommend[t],music_recommend_tab[t],music_recommend_oto[t]]
     }
      

    text_random = Array["ギターって...いいよな", "ギター練習したのか？"]
    music_recommend = Array["Layla(Eric Clapton)", "Are You Gonna Go My Way（Lenny Kravitz)", "Walk This Way（Aerosmith)","20th Century Boy（T.Rex)", "Whole Lotta Love（Led Zeppelin）", "Helter Skelter（The Beatles）","Painkiller（Judas Priest）","歌舞伎町の女王（椎名林檎）"]
    music_recommend_tab = Array["https://www.dropbox.com/home?preview=SP32-20041117-174117.gif", "http://bandbigginer.boo.jp/wp-content/uploads/20120213areyougonnagomyway.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213walkthisway.jpg","http://bandbigginer.boo.jp/wp-content/uploads/2012021320thcenturyboy.jpg","http://bandbigginer.boo.jp/wp-content/uploads/20120213wholelottalove.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213helterskelter.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213painkiller.jpg", "歌舞伎町の女王（椎名林檎）"]
    music_recommend_oto = Array["A","B","C","D","E","F","G"]
    code_minor = Array["Am", "Bm", "Cm", "Dm", "Em", "Fm", "Gm"]
    code_major = Array["A", "B", "C", "D", "E", "F", "G"]
    code_shinkou = Array["D - A - Bm - F#m - G - D - G - A", "F - G - Em - Am", "Am - F - G - C"]
    code_shinkou_music = Array["aaa","bbb","ccc"]
#気分　８通りくらい
    code_shinkou_major = Array["C-G-Am-Em-F-C-F-G",""]
    code_shinkou_major_music = Array[]
    code_shinkou_minor = Array["Am-Dm-G-Am","Am-Dm-E7-Am","Am-G-F-Em-Dm-C-Bm7-5-E7"]
    code_shinkou_minor_music = Array[]
    flase_recommend = Array[]
#天気　１０通りくらい
    music_recommend_hare = Array["Back in Black(AC/DC)","Brainstorm(Arctic Monkeys)","Loney Boy(The Loney Boy)","Smells Like Tenn Spirit(Nirvana)","Voodoo Child (Jimi Hendrix)","Another number(The Cribes)","Take The Long Road And Walk It(The Music)","Immigrant Song(Jimi Hendrix)","12:51(The Strokes)","Supersonic(Oasis)","Can't Stop(Red Hot Chili Peppers)"]
    music_recommend_ame = Array[]
    music_recommend_kumori = Array[]

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
                    
                    
                    
            elsif text.include?("フレーズ") & text.include?("おすすめ") or text.include?("リフ")
                recommend_sample = recommend.sample
                sender.reply(text: "[曲名]\n#{recommend_sample[0]}\n[サンプル音]\n#{recommend_sample[2]}\n[TAB]")
                sender.reply({ "attachment": {"type": "image","payload": {"url": recommend_sample[1]}}})
                
            elsif text.include?("コード進行")
                code_sample = code.sample
                sender.reply(text: "#{code_sample[0]}\n[サンプル音]\n#{code_sample[1]}")
                
            elsif text.include?("曲") & text.include?("おすすめ")
                sender.reply(text: "#{music_recommend.sample}")
            
 #奏法などに対する応答
            elsif text.include?("アルペジオ") && text.end_with?("？") or text == ("アルペジオ")
              sender.reply(text: "アルペジオは、1本1本の弦をバラバラに弾く奏法のことだな！")
              
              sender.reply({ "attachment": {
              "type": "audio",
              "payload": {
                 "url":text_C_music
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
            elsif text.include?("疲れた") or text.include?("しんどい") or text.include?("きつい")
               sender.reply(text: "今の君は#{code_minor.sample}な気分なんだな！！そんな君にはこのフレーズを伝授しよう")
               sender.reply(text: "#{code_shinkou.sample}")
               
                        #コードに対する応答
           # elsif text.include?("コード一覧")
            #    sender.reply({ "attachment": {"type": "image","payload": {"url": }}})
            elsif text == "Amコード" or text == "Amコード" or text == "Am" or text == "Am"
                sender.reply({ "attachment":{
                 "type":"template",
                         "payload":{
                             "template_type":"generic",
                             "elements":[
                               {  "title":"Amコードの押さえ方",
                                  "image_url":text_Am,
                                  "buttons":[
                                       {
                                           "type":"postback",
                                           "title":"Amコードを使ったコード進行",
                                           "payload":"using_Am"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"他のマイナーコード",
                                           "payload":"other_Am"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"Amコードのサンプル音",
                                           "payload":"music_Am"
                                       }
                                            ]
                              }
                                ]       
                                   }
                                 }
                             })
            elsif text == "Aコード"  or text == "A" 
                sender.reply({ "attachment":{
                 "type":"template",
                         "payload":{
                             "template_type":"generic",
                             "elements":[
                               {  "title":"Aコードの押さえ方",
                                  "image_url":text_A,
                                  "buttons":[
                                       {
                                           "type":"postback",
                                           "title":"Aコードを使ったコード進行",
                                           "payload":"using_A"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"他のマイナーコード",
                                           "payload":"other_A"
                                       },
                                       {
                                           "type":"postback",
                                           "title":"Aコードのサンプル音",
                                           "payload":"music_A"
                                       }
                                            ]
                              }
                                ]       
                                   }
                                 }
                             })
            elsif text == "Cコード" or text == "cコード" or text == "C" or text == "c"
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
                             
            elsif text == "Gコード" or text == "gコード" or  text == "G" or text == "g"
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

