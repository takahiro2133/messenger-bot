class MessengerBotController < ActionController::Base
  #def message(event, sender)
    # profile = sender.get_profile(field) # default field [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
     #sender.reply({ text: "#{event['message']['text']}" })
   
    #text.sender = event['message']['text']
    

    #sender.reply({ text: "gameをしませんか？" })

      
  #end

  def message(event, sender)
    profile = sender.get_profile[:body]
    profile_last_name = profile['last_name']
    profile_first_name = profile['first_name']
    sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"#{profile_last_name} #{profile_first_name}さんこんにちは",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"OVER",
                        "payload":"OVER"
                    },
                    {
                        "type":"postback",
                        "title":"UNDER",
                        "payload":"UNDER"
                    }
                ]
            }
         }
      })
  end 
      
  def postback(event, sender)
    payload = event["postback"]["payload"]
    case payload
    when "OVER"
      sender.reply({ text: "上が押されたよ！" })
    when "UNDER"
      sender.reply({ text: "下が押されたよ！" })
    end
  end
  


  def delivery(event, sender)
  end
  
end
