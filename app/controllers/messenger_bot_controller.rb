class MessengerBotController < ActionController::Base
  def message(event, sender)
    # profile = sender.get_profile(field) # default field [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
     #sender.reply({ text: "#{event['message']['text']}" })
   
    #text.sender = event['message']['text']
    

    sender.reply({ text: "gameをしませんか？" })

      
  end
  
  
     # sender.reply(
     # { text: "#{event['message']['text']}" })

  def delivery(event, sender)
  end

  def postback(event, sender)
    payload = event["postback"]["payload"]
    case payload
    when :something
      #ex) process sender.reply({text: "button click event!"})
    end
  end
end

