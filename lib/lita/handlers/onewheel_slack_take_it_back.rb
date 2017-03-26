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
        Lita.logger.debug redis.hget('lita', 'slack_last')
        Lita.logger.debug redis.get('slack_last')
      end
    end

    Lita.register_handler(OnewheelSlackTakeItBack)
  end
end
