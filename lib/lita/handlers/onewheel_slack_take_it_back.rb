module Lita
  module Handlers
    class OnewheelSlackTakeItBack < Handler
      route(/take it back/i,
            :handle_delete)
      route(/Good morning./,
            :handle_cosmos)

      def handle_cosmos(response)
        resp = response.reply "Some text"
        Lita.logger.debug resp.inspect
        m = redis.hset('stib', 'last', resp.to_s)
        redis.set('one', 'two')
        Lita.logger.debug "Redis response: #{m}"
        # redis.set('slack_last', resp)
      end

      def handle_delete(response)
        Lita.logger.debug "Hangling delete"
        Lita.logger.debug redis.hget('stib', 'last')
        Lita.logger.debug redis.get('one')
        # response.reply redis.hget('stib', 'last')
      end
    end

    Lita.register_handler(OnewheelSlackTakeItBack)
  end
end
