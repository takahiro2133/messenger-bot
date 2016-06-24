class MessengerBotController < ActionController::Base

  def message(event,sender)
    text = event['message']['text']
             if text == "こんにちは"
               sender.reply(text: "hello")
             elsif text.include?("アルペジオ") && text.end_with?("？") or text == ("アルペジオ")
               sender.reply(text: "アルペジオっつーのは、1本1本の弦をバラバラに弾く奏法のことだな！")
               sender.reply({ "attachment": {
                "type": "image",
                "payload": {
                  "url": "http://mfc-music.com/wp-content/uploads/2015/03/C%E3%82%B3%E3%83%BC%E3%83%89.png"
                          }
                                              }
                            })
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
                                           "title":"Cを使った楽曲",
                                           "payload":"music_c"
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
    end
  end
end 
