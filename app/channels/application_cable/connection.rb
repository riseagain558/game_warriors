module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_warrior

    def connect
      self.current_warrior = find_verified_warrior
    end

    private

    def find_verified_warrior
      if verified_warrior = Warrior.find_by(id: session[:warrior_id])
        verified_warrior
      else
        reject_unauthorized_connection
      end
    end

    def session
      key = Rails.application.config.session_options.fetch(:key)
      cookies.encrypted[key]&.symbolize_keys || {}
    end
  end
end
