class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
  def message(event,sender)
    text = event['message']['text']
    
    text_C  = 'http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png'
    text_G  = 'http://mfc-music.com/wp-content/uploads/2015/03/G%E3%82%B3%E3%83%BC%E3%83%89.png'
    text_Am = 'http://mfc-music.com/wp-content/uploads/2015/03/Am%E3%82%B3%E3%83%BC%E3%83%89.png'
    
    text_random = Array["エレキギターの世界は常識がなく自分で決めなくてはならない", "どんなことでも主流に巻き込まれないとダメだろう","音楽って流行りがあるようで実はもうなくなっちゃったんだ","フェスのプライオリティは音楽ではなく人","ギターの楽しさはもう証明されている"]
    music_recommend = Array["Walk This Way（Aerosmith)","20th Century Boy（T.Rex)", "Helter Skelter（The Beatles）","Painkiller（Judas Priest）","歌舞伎町の女王（椎名林檎）","Long Train Running(The Doobie Brothers)"]
    music_recommend_tab = Array["http://bandbigginer.boo.jp/wp-content/uploads/20120213walkthisway.jpg","http://bandbigginer.boo.jp/wp-content/uploads/2012021320thcenturyboy.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213helterskelter.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213painkiller.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/02120213kabuki.jpg","https://guitarsenal.files.wordpress.com/2011/09/the-doobie-brothers-long-train-runnin.png"]
    music_recommend_oto = Array["http://kusapan.com/fbmbot/walk%20this%20way.mp3","http://kusapan.com/fbmbot/21th.mp3","http://kusapan.com/fbmbot/beatles.mp3","http://kusapan.com/fbmbot/painkiler.mp3","http://kusapan.com/fbmbot/ringo.mp3","http://kusapan.com/fbmbot/long%20train.mp3"]
    code_minor = Array["Am", "Bm", "Cm", "Dm", "Em", "Fm", "Gm", "F#m", "C#m", "G#m"]
    code_major = Array["A", "B", "C", "D", "E", "F", "G"]
    code_shinkou = Array["Am-Em-F-C","Am-Dm-E7-Am","Am-G-F-Em-Dm-C-Bm7-E7","D-A-Bm-Em-Fm-G-D-G-A","A-E-F#m7-E-DM7-C#m7-Bm7-E","A-Fm-D-E","C-D-Em-G","C-G-Am-Em-F-C-F-G","Fm-A-B-E","Cadd9-G-D-Em7"]
    code_shinkou_music = Array["http://kusapan.com/fbmbot/AmEmFC.mp3","http://kusapan.com/fbmbot/AmDmE7Am.mp3","http://kusapan.com/fbmbot/AmGFEmDmC.mp3","http://kusapan.com/fbmbot/DABmEmFmGDGA.mp3","http://kusapan.com/fbmbot/yamashita.mp3","http://kusapan.com/fbmbot/AFmDE.mp3","http://kusapan.com/fbmbot/CDEmG.mp3","http://kusapan.com/fbmbot/CGAmEFGFA.mp3","http://kusapan.com/fbmbot/FmABE.mp3","http://kusapan.com/fbmbot/talar.mp3"]
    

    code_shinkou_major = Array["A-Fm-D-E","C-D-Em-G","C-G-Am-Em-F-C-F-G","Fm-A-B-E","Cadd9-G-D-Em7"]
    code_shinkou_major_music = Array["http://kusapan.com/fbmbot/AFmDE.mp3","http://kusapan.com/fbmbot/CDEmG.mp3","http://kusapan.com/fbmbot/CGAmEFGFA.mp3","http://kusapan.com/fbmbot/FmABE.mp3","http://kusapan.com/fbmbot/talar.mp3"]
    code_shinkou_minor = Array["Am-Em-F-C","Am-Dm-E7-Am","Am-G-F-Em-Dm-C-Bm7-E7","D-A-Bm-Em-Fm-G-D-G-A","A-E-F#m7-E-DM7-C#m7-Bm7-E"]
    code_shinkou_minor_music = Array["http://kusapan.com/fbmbot/AmEmFC.mp3","http://kusapan.com/fbmbot/AmDmE7Am.mp3","http://kusapan.com/fbmbot/AmGFEmDmC.mp3","http://kusapan.com/fbmbot/DABmEmFmGDGA.mp3","http://kusapan.com/fbmbot/yamashita.mp3"]

    music_recommend_hare = Array["Back in Black(AC/DC)","Brainstorm(Arctic Monkeys)","Loney Boy(The Loney Boy)","Smells Like Tenn Spirit(Nirvana)","Voodoo Child (Jimi Hendrix)","Another number(The Cribes)","Take The Long Road And Walk It(The Music)","Immigrant Song(Jimi Hendrix)","12:51(The Strokes)","Supersonic(Oasis)","Can't Stop(Red Hot Chili Peppers)"]
    music_recommend_ame = Array[]
    music_recommend_kumori = Array[]
    
    shinkoumajor = Array.new
    0.upto(4){|t|
      shinkoumajor[t] = [code_shinkou_major[t],code_shinkou_major_music[t]]
     }
     
    shinkouminor = Array.new
    0.upto(4){|t|
      shinkouminor[t] = [code_shinkou_minor[t],code_shinkou_minor_music[t]]
     }
     
    code = Array.new
    0.upto(9){|t|
      code[t] = [code_shinkou[t],code_shinkou_music[t]]
     }
    
    recommend =Array.new
    0.upto(5){|t|
      recommend[t] = [music_recommend[t],music_recommend_tab[t],music_recommend_oto[t]]
     }
      
    
            if text.include?("天気")
                    uri = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010'
                    res = JSON.load(open(uri).read)
                    weather_today = res['forecasts'][0]
                    city = res['location']['city']
                    weather = weather_today['telop']
                    today = "#{weather_today['dateLabel']}の#{city}の天気は「#{weather_today['telop']}」だな。"
                    
                    if weather == "晴れ"
                          sender.reply({ text: "#{today}こんな晴れた日には、#{music_recommend_hare.sample}でロックンロール！！" })
                    elsif weather == "曇のち雨"
                          sender.reply({ text: "#{today}こんなしみったれた日は#{music_recommend_hare.sample}でも聞いてロックしろ！！" })
                    elsif weather == "晴のち曇"
                          sender.reply({ text: "#{today}こんな日は#{music_recommend_hare.sample}なんかいいんじゃないか！" })
                    elsif weather == "曇のち晴"
                          sender.reply({ text: "#{today}こんな日は#{music_recommend_hare.sample}なんかいいんじゃないか！" })
                    elsif weather == "雨"
                          sender.reply({ text: "#{today}こんな日は#{music_recommend_hare.sample}でも聞いてロックしろ！！" })
                    elsif weather == "曇り"
                          sender.reply({ text: "#{today}こんな日は#{music_recommend_hare.sample}でも聞いてロックしろ！！" })
                    elsif weather == "曇時々雨"
                          sender.reply({ text: "#{today}こんな日は#{music_recommend_hare.sample}でも聞いてロックしろ！！" })
                 　  elsif weather == "曇時々晴"
                      　　sender.reply({ text: "#{today}"})
                    else  
                      sender.reply( text: "天気なんか知るか" )
                    end
                    
            elsif text.include?("フレーズ") & text.include?("おすすめ") or text.include?("リフ")
                recommend_sample = recommend.sample
                sender.reply(text: "[曲名]\n#{recommend_sample[0]}\n[TAB]")
                sender.reply({ "attachment": {"type": "image","payload": {"url": recommend_sample[1]}}})
                sender.reply({ "attachment": {"type": "audio","payload": {"url": recommend_sample[2]}}})
            
            elsif text.include?("コード進行")
                code_sample = code.sample
                sender.reply(text: "こんなのはどうだい？\n#{code_sample[0]}")
                sender.reply({ "attachment": {"type": "audio","payload": {"url": code_sample[1]}}})
                
            elsif text.include?("曲") & text.include?("おすすめ")
                sender.reply(text: "#{music_recommend.sample}")
                
#奏法などに対する応答
            elsif text.include?("アルペジオ") && text.end_with?("？") or text == ("アルペジオ")
              sender.reply(text: "1本1本の弦をバラバラに弾く奏法のことだな！")
            
            elsif text.include?("チョーキング") && text.end_with?("？") or text == ("チョーキング")
              sender.reply(text: "弦を弾いた後、押し弦を動かして音の高さを変える奏法のことだな！")
              
            elsif text.include?("ハンマリング") && text.end_with?("？") or text == ("ハンマリング")
              sender.reply(text: "弦を押さえてピッキングせずに音を出すテクニックのことだな！")
            
            elsif text.include?("プリング") && text.end_with?("？") or text == ("プリング")
              sender.reply(text: "指板上の指で弦を引っ掻いて演奏することだな！")
            
#気分などに対する応答                
            elsif text.include?("疲れた") or text.include?("しんどい")
               shinkouminor_sample = shinkouminor.sample
               sender.reply(text: "今の君は#{code_minor.sample}な感じだね〜！今の君を表現するとこんな感じかな")
               sender.reply(text: "#{shinkouminor_sample[0]}")
               sender.reply({ "attachment": {"type": "audio","payload": {"url": shinkouminor_sample[1]}}})
              
            
            elsif text.include?("楽しい") or text.include?("嬉しい")
               shinkoumajor_sample = shinkoumajor.sample
               sender.reply(text: "今の君は#{code_major.sample}な気分なんだな！！そんな君にはこのフレーズを伝授しよう")
               sender.reply(text: "#{shinkoumajor_sample[0]}")
               sender.reply({ "attachment": {"type": "audio","payload": {"url": shinkoumajor_sample[1]}}})
               
#コードに関すること
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
                                           "title":"Cコードのサンプル音",
                                           "payload":"music_c"
                                       }
                                            ]
                              }
                                ]       
                                   }
                                 }
                             })
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
                                           "title":"Amコードのサンプル音",
                                           "payload":"music_Am"
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
                                           "title":"Gコードのサンプル音",
                                           "payload":"music_g"
                                       }
                                            ]
                              }
                                ]       
                                   }
                                 }
                             })
            else
              sender.reply(text: "#{text_random.sample}")
            end
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)
    code_C = Array["C-G-Am-Em-F-C-F-G"]
    code_C_music = Array["http://kusapan.com/fbmbot/CGAmEFCFG.mp3"]
　　text_C  = 'http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png'
　　text_C_music = 'https://www.dropbox.com/home?preview=C%E3%82%B3%E3%83%BC%E3%83%89.mp3'
　　text_G  = 'http://mfc-music.com/wp-content/uploads/2015/03/G%E3%82%B3%E3%83%BC%E3%83%89.png'
　　code_G = Array[]
　　code_G_music = Array[]
    text_Am = 'http://mfc-music.com/wp-content/uploads/2015/03/Am%E3%82%B3%E3%83%BC%E3%83%89.png'
    code_Am = Array[]
    code_Am_music = Array[]
    payload = event["postback"]["payload"]
　　  case payload
      when "using_c"
        sender.reply(text: "#{code_C.sample}")
        sender.reply({ "attachment": {"type": "audio","payload": {"url": "http://kusapan.com/fbmbot/CGAmEFGFA.mp3"}}})
      when "music_c"
        sender.reply({ "attachment": {"type": "audio","payload": {"url": "http://kusapan.com/fbmbot/Cコード.mp3"}}})
        
      when "using_Am"
        sender.reply(text: "#{code_C.sample}")
        sender.reply({ "attachment": {"type": "audio","payload": {"url": "http://kusapan.com/fbmbot/CGAmEFGFA.mp3"}}})
      when "music_Am"
        sender.reply({ "attachment": {"type": "audio","payload": {"url": "http://kusapan.com/fbmbot/Cコード.mp3"}}})
        
      when "using_G"
        sender.reply(text: "#{code_C.sample}")
        sender.reply({ "attachment": {"type": "audio","payload": {"url": "http://kusapan.com/fbmbot/CGAmEFGFA.mp3"}}})
      when "music_G"
        sender.reply({ "attachment": {"type": "audio","payload": {"url": "http://kusapan.com/fbmbot/Cコード.mp3"}}})
        
      
      end
  end
  
end 

