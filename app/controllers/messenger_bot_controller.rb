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
    #music_recommend_hare = Array["Back in Black(AC/DC)","Brainstorm(Arctic Monkeys)","Loney Boy(The Loney Boy)","Smells Like Tenn Spirit(Nirvana)","Voodoo Child (Jimi Hendrix)","Another number(The Cribes)","Take The Long Road And Walk It(The Music)","Immigrant Song(Jimi Hendrix)","12:51(The Strokes)","Supersonic(Oasis)","Can't Stop(Red Hot Chili Peppers)"]
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
    
          

　　　sender.reply(text: "hello")
            
      
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

