require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bunq < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: "https://oauth.bunq.com",
        authorize_url: "/auth",
        token_url: "https://api.oauth.bunq.com/v1/token"
      }

      uid do
        puts options
        request.params[options.uid_field.to_s]
      end

      info do
        options.fields.inject({}) do |hash, field|
          hash[field] = request.params[field.to_s]
          hash
        end
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'bunq', 'Bunq'
