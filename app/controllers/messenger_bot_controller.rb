class MessengerBotController < ActionController::Base

  def message(event,sender)
    text = event['message']['text']
             if text == "こんにちは"
               sender.reply(text: "hello")
             elsif text == "cコード"
               sender.reply({ "attachment":{
                 "type":"template",
                         "payload":{
                             "template_type":"generic",
                             "elements":[
                               {  "title":"Cの押さえ方",
                                  "image_url":"http://knatsubrand81.com/osaekata/chords-c-l.jpg",
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
