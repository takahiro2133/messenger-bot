class MessengerBotController < ActionController::Base
    require 'json'
    require 'open-uri'
    require 'uri'
  
  def message(event,sender)
    
    text_random = Array["ギターって...いいよな", "ギター練習したのか？"]
    music_recommend = Array["Layla(Eric Clapton)", "Are You Gonna Go My Way（Lenny Kravitz)", "Walk This Way（Aerosmith)","20th Century Boy（T.Rex)", "Whole Lotta Love（Led Zeppelin）", "Helter Skelter（The Beatles）","Painkiller（Judas Priest）","歌舞伎町の女王（椎名林檎）"]
    music_recommend_tab = Array["https://www.dropbox.com/home?preview=SP32-20041117-174117.gif", "http://bandbigginer.boo.jp/wp-content/uploads/20120213areyougonnagomyway.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213walkthisway.jpg","http://bandbigginer.boo.jp/wp-content/uploads/2012021320thcenturyboy.jpg","http://bandbigginer.boo.jp/wp-content/uploads/20120213wholelottalove.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213helterskelter.jpg", "http://bandbigginer.boo.jp/wp-content/uploads/20120213painkiller.jpg", "歌舞伎町の女王（椎名林檎）"]
    music_recommend_oto = Array["A","B","C","D","E","F","G"]
    code_minor = Array["Am", "Bm", "Cm", "Dm", "Em", "Fm", "Gm"]
    code_major = Array["A", "B", "C", "D", "E", "F", "G"]
    code_shinkou = Array["D - A - Bm - F#m - G - D - G - A", "F - G - Em - Am", "Am - F - G - C"]
    code_shinkou_music = Array["aaa","bbb","ccc"]
    
    code = Array.new
    0.upto(6){|t|
      code[t] = [code_shinkou[t],code_shinkou_music[t]]
     }
    
    recommend =Array.new
      0.upto(6){|t|
      recommend[t] = [music_recommend[t],music_recommend_tab[t],music_recommend_oto[t]]
     }
            if text.include?("フレーズ") & text.include?("おすすめ") or text.include?("リフ")
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
            else
              sender.reply(text: "hello")
            end
  end
  
 
  def delivery(event, sender)
  end     
  
  def postback(event, sender)

  end
  
end 

