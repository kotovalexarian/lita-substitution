##
# Lita module.
#
module Lita
  ##
  # Lita extensions module.
  #
  module Extensions
    ##
    # Shell-like command substitution for the Lita chat bot.
    #
    class Substitution
      def self.call(payload)
        message = payload[:message]
        route = payload[:route]

        !(message.body =~ /[^\$]\$\(/) || route.extensions[:substitution]
      end

      Lita.register_hook(:validate_route, self)
    end
  end
end
