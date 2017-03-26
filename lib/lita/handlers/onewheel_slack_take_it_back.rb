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
        Lita.logger.debug Lita.adapters.inspect
        Lita.logger.debug Lita.adapters[:slack].inspect
        Lita.logger.debug Lita.adapters[:slack]::API.inspect
        Lita.logger.debug robot.config.adapters.inspect
        Lita.logger.debug robot.config.adapters.children.inspect
        Lita.logger.debug robot.config.adapters.call_api
        # slack_config = {token: Lita.config.adapters.slack.token}
        # Lita.logger.debug(slack_config)
        # Lita.adapters[:slack]::API.new(slack_config).call_api('delete')
      end
    end

    Lita.register_handler(OnewheelSlackTakeItBack)
  end
end
