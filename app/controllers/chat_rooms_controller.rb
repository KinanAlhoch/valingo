class ChatRoomsController < ApplicationController
  def index
    ChatRoom.where('created_at <= ?', Time.now - 24.hours).map{|r| r.update_attribute(:expired, true)}
    @chat_rooms = ChatRoom.where(:expired => false)
  end

  def new
    @chat_room = ChatRoom.new(:user_id => current_user.id)
    @chat_room.token =  SecureRandom.urlsafe_base64
    if @chat_room.save
      redirect_to chat_room_path(@chat_room)
    else
      redirect_to root_path, :notice => "Something went wrong, plz try again"
    end


  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    render :layout => "chat_room"
  end
end