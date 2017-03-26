module Lita
  module Handlers
    class OnewheelSlackTakeItBack < Handler
      route(/take (it|that) back/i,
            :handle_delete)
      route(/take(it|that)back/i,
            :handle_delete,
            command: true)
      route(/undo/i,
            :handle_delete,
            command: true)

      def handle_delete(response)
        last_message = JSON.parse(redis.get('slack_last').gsub(/=>/, ':'))
        Lita.logger.debug last_message.inspect
        Lita.logger.debug last_message['channel']
        Lita.logger.debug last_message['ts']
        Lita.logger.debug last_message['message']['user']
      end
    end

    Lita.register_handler(OnewheelSlackTakeItBack)
  end
end
