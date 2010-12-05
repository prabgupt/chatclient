require "juggernaut"

class ChatController < ApplicationController
	def send_message
	@messg = params[:msg_body]
	@sender = params[:sender]
 	Juggernaut.publish(select_channel("/channel1_channel2"), parse_chat_message(params[:msg_body], params[:sender]))	
	respond_to do |format|
	    format.js
  	end
	end

	def parse_chat_message(msg, user)
	return "#{user}: #{msg}"
	end

	def select_channel(receiver)
	puts "#{receiver}"
	return "/chats#{receiver}"
	end
end
