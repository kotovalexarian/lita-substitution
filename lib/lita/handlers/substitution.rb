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
      # insert handler code here

      Lita.register_handler(self)
    end
  end
end
