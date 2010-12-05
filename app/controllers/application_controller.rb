require "juggernaut"
class ApplicationController < ActionController::Base
	def send_message
        render_text "<li>" + params[:msg_body] + "</li>"
        Juggernaut.publish("/chats", parse_chat_message(params[:msg_body], "Prabhat"))
        end
        def parse_chat_message(msg, user)
        return "#{user} says: #{msg}"
        end

  protect_from_forgery
end
