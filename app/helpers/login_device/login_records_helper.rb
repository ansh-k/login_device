module LoginDevice
  module LoginRecordsHelper
    def check_device(current_user, cookies, request)
      if current_user.present? 
        if cookies[:token].nil?
          record = create_record(current_user, request)
          update_token(record, cookies)
        else
          record = get_user_by_token(cookies)
        end
        update_last_seen(record)
      end
    end

    def remove_record(current_user, cookies, request)
      if current_user.present?
        record = get_user_by_token(cookies)
        update_last_seen(record)
        remove_token(cookies, record)
      end
    end

    private
      def get_user_by_token(cookies)
        LoginDevice::LoginRecord.find_by_token(cookies[:token])
      end

      def create_record(current_user, request)
        device = "#{request.user_agent} + #{request.remote_ip}"
        LoginDevice::LoginRecord.find_or_create_by!(user_id: current_user.id, device: device)
      end

      def update_token(record, cookies)
        cookies[:token] = SecureRandom.hex(10)
        record.update_attributes(token: cookies[:token], is_active: true)
      end

      def update_last_seen(record)
        last_seen = DateTime.now
        record.update_attributes(last_seen: last_seen)
      end

      def remove_token(cookies, record)
        cookies.delete :token
        record.update_attributes(is_active: false)
      end
  end
end
