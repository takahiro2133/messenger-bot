class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
  def message(event,sender)
    text = event['message']['text']
    text_random = Array["ギターって...いいよな", "ギター練習したのか？"]
    music_recommend = Array["Are You Gonna Go My Way（Lenny Kravitz)", "Walk This Way（Aerosmith)","20th Century Boy（T.Rex)", "Whole Lotta Love（Led Zeppelin）", "Helter Skelter（The Beatles）","Painkiller（Judas Priest）","歌舞伎町の女王（椎名林檎）"]
    music_recommend_tab = Array["http://bandbigginer.boo.jp/wp-content/uploads/20120213areyougonnagomyway.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213walkthisway.jpg","http://bandbigginer.boo.jp/wp-content/uploads/2012021320thcenturyboy.jpg","http://bandbigginer.boo.jp/wp-content/uploads/20120213wholelottalove.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213helterskelter.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213painkiller.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/02120213kabuki.jpg"]
    music_recommend_oto = Array["A","http://kusapan.com/fbmbot/walk%20this%20way.mp3","C","D","E","F","G"]
    code_minor = Array["Am", "Bm", "Cm", "Dm", "Em", "Fm", "Gm"]
    code_major = Array["A", "B", "C", "D", "E", "F", "G"]
    code_shinkou = Array["D - A - Bm - F#m - G - D - G - A", "F - G - Em - Am", "Am - F - G - C"]
    code_shinkou_music = Array["aaa","bbb","ccc"]

    code_shinkou_major = Array["C-G-Am-Em-F-C-F-G","C-G-Am-G-F-E7-Am-D7-G7","C-A-Dm-G7","C-Am-F-G7","C-Em-Dm-C"]
    code_shinkou_major_music = Array[]
    code_shinkou_minor = Array["Am-Dm-G-Am","Am-Dm-E7-Am","Am-G-F-Em-Dm-C-Bm7-5-E7","Am-Dm-Em-Am","Am-Dm-Am-E"]
    code_shinkou_minor_music = Array[]
    flase_recommend = Array[]

    music_recommend_hare = Array["Back in Black(AC/DC)","Brainstorm(Arctic Monkeys)","Loney Boy(The Loney Boy)","Smells Like Tenn Spirit(Nirvana)","Voodoo Child (Jimi Hendrix)","Another number(The Cribes)","Take The Long Road And Walk It(The Music)","Immigrant Song(Jimi Hendrix)","12:51(The Strokes)","Supersonic(Oasis)","Can't Stop(Red Hot Chili Peppers)"]
    music_recommend_ame = Array[]
    music_recommend_kumori = Array[]
    
    code = Array.new
    0.upto(6){|t|
      code[t] = [code_shinkou[t],code_shinkou_music[t]]
     }
    
    recommend =Array.new
      0.upto(6){|t|
      recommend[t] = [music_recommend[t],music_recommend_tab[t],music_recommend_oto[t]]
     }
      
    
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
                          sender.reply({ text: "#{today}こんな日は#{music_recommend_hare.sample}でも聞いてロックしろ！！" })
                    elsif weather == "曇時々雨"
                          sender.reply({ text: "#{today}こんな日はこの曲でも聞いてロックしろ！！" })
                 　  elsif weather == "曇時々晴"
                      　　sender.reply({ text: "#{today}"})
                    else  
                      sender.reply( text: "天気なんか知るか" )
                    end
                    
            elsif text.include?("フレーズ") & text.include?("おすすめ") or text.include?("リフ")
                recommend_sample = recommend.sample
                sender.reply(text: "[曲名]\n#{recommend_sample[0]}\n[サンプル音]\n#{recommend_sample[2]}\n[TAB]")
                sender.reply({ "attachment": {"type": "audio","payload": {"url": recommend_sample[1]}}})
                
            elsif text.include?("コード進行")
                code_sample = code.sample
                sender.reply(text: "#{code_sample[0]}\n[サンプル音]\n#{code_sample[1]}")
                
            elsif text.include?("曲") & text.include?("おすすめ")
                sender.reply(text: "#{music_recommend.sample}")
                
#奏法などに対する応答
            elsif text.include?("アルペジオ") && text.end_with?("？") or text == ("アルペジオ")
              sender.reply(text: "アルペジオは、1本1本の弦をバラバラに弾く奏法のことだな！")
            
            elsif text.include?("チョーキング") && text.end_with?("？") or text == ("チョーキング")
              sender.reply(text: "チョーキングは、弦を弾いた後、押し弦を動かして音の高さを変える奏法のことだな！")
            
#気分などに対する応答                
            elsif text.include?("疲れた") or text.include?("しんどい")
               sender.reply(text: "今の君は#{code_minor.sample}な気分なんだな！！そんな君にはこのフレーズを伝授しよう")
               sender.reply(text: "#{code_shinkou.sample}")
            
            elsif text.include?("楽しい") or text.include?("嬉しい")
               sender.reply(text: "今の君は#{code_major.sample}な気分なんだな！！そんな君にはこのフレーズを伝授しよう")
               sender.reply(text: "#{code_shinkou.sample}")
            else
              sender.reply(text: "hello")
            end
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)

  end
  
end 

