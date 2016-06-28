class MessengerBotController < ActionController::Base
  
  
  BingAPIKEY = 'RWVDsTmHZY47DRyQQq4iJmvb6Ut1ENBPeRk+OdfFthY'
  
  def message(event,sender)
    text = event['message']['text']
             if text == "こんにちは"
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
               sender.reply("url": "https://www.dropbox.com/s/xijhmun62xnb4o8/C%E3%82%B3%E3%83%BC%E3%83%89.mp3?dl=0")
               
               
            #コードに対する応答               
             elsif text == "Cコード" or text == "cコード"
               sender.reply({ "attachment":{
                 "type":"template",
                         "payload":{
                             "template_type":"generic",
                             "elements":[
                               {  "title":"Cコードの押さえ方",
                                  "image_url":"http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png",
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
                                  "image_url":"http://mfc-music.com/wp-content/uploads/2015/03/G%E3%82%B3%E3%83%BC%E3%83%89.png",
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
    payload = event["postback"]["payload"]
    case payload
    when "using_c"
      sender.reply(text: "C！")
    when "other_c"
      sender.reply(text: "otherC")
    when "music_c"
      sender.reply(text: "music")
      
    when "using_g"
      sender.reply(text: "G！")
    when "other_g"
      sender.reply(text: "otherG")
    when "music_g"
      sender.reply(text: "music")
    end
  end
end 
