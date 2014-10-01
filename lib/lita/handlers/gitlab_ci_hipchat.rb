module Lita
  module Handlers
    class GitlabCiHipchat < Handler
      http.post '/gitlab-ci', :receive

      def self.default_config(config)
      end

      def receive(request, response)
        json_data = JSON.parse(request.body.read)
        message   = Lita::GitlabCi::BuildMessage.new(hipchat, json_data)
        message.send_to_hipchat!
      end

      private

      def hipchat
        @hipchat ||= hipchat_client[config.room]
      end

      def hipchat_client
        @hipchat_client ||= HipChat::Client.new(config.api_token, api_version: 'v2')
      end
    end

    Lita.register_handler(GitlabCiHipchat)
  end
end
