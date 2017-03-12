module Lita
  module Handlers
    class OnewheelSlackTakeItBack < Handler
      route(/take it back/i,
            :handle_delete)
      route(/Good morning./,
            :handle_cosmos)

      def handle_cosmos(response)
        resp = response.reply "Some text"
        Lita.logger.debug resp
        redis.set('slack_last', resp)
      end

      def handle_delete
        Lita.logger.debug "Hangling delete"
        Lita.logger.debug "#{redis.get('slack_last')}"
      end
    end

    Lita.register_handler(OnewheelSlackTakeItBack)
  end
end
