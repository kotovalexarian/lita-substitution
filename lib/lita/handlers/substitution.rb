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
        message = response.message
        source = message.source
        command, substitutions = parse(message.body)

        substitutions.each do |position, subcommand|
          channel = Channel.new(robot, subcommand, source)
          channel.command!

          result = ''
          channel.on_reply do |*strings|
            result << strings.flatten.join("\n")
          end

          robot.receive(channel)

          command.insert(position, result)
        end

        channel = Channel.new(robot, command, source)
        channel.command!

        channel.on_reply do |*strings|
          response.reply(strings.flatten.join("\n"))
        end

        robot.receive(channel)
      end

    protected

      class Channel < Message
        def reply(*strings)
          @on_reply.call(*strings) if @on_reply
        end

        def on_reply(&block)
          @on_reply = block
        end
      end

      def parse(text)
        ['randcase ', { 9 => 'fake lorem sentence' }]
      end

      Lita.register_handler(self)
    end
  end
end
