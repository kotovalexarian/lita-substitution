##
# Lita module.
#
module Lita
  ##
  # Lita handlers module.
  #
  module Handlers
    ##
    # Shell-like command substitution for the Lita chat bot.
    #
    class Substitution < Handler
      route(/[^\$]\$\(/, command: true, substitution: true) do |response|
        command, substitutions = parse(response.message.body)

        response.reply(command.inspect)
        response.reply(substitutions.inspect)
      end

    protected

      def parse(text)
        ['randcase ', { 9 => 'fake lorem sentence' }]
      end

      Lita.register_handler(self)
    end
  end
end
