class MessengerBotController < ActionController::Base
  def message(event, sender)
    # profile = sender.get_profile(field) # default field [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
    text.sender = event['message']['text']
    
      sender.reply(
      if text.sender != nil
      { text: "#{gameをしませんか？}" }
      else{ text: "#{もういいです！！}"}
      end
        )
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

