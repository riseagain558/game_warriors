class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_chanel"

    if current_warrior
      current_warrior.update(is_online: true)
      ActionCable.server.broadcast "appearance_channel", { warrior: current_warrior.id, online: :on }
    end
  end

  def unsubscribed
    if current_warrior
      current_warrior.update(is_online: false)
      ActionCable.server.broadcast "appearance_channel", { warrior: current_warrior.id, online: :off }
    end
  end
end