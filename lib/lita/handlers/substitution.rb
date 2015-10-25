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
      # TODO
      # REGEXP = /(^|[^\$])\$\(/
      REGEXP = /\$\(/

      route(REGEXP, command: true, substitution: true) do |response|
        message = response.message
        source = message.source

        command, substitutions = parse(message.body)
        shift = 0

        substitutions.each do |position, subcommand|
          channel = Channel.new(robot, subcommand, source)
          channel.command!

          result = ''
          delta = 0
          channel.on_reply do |*strings|
            s = strings.flatten.join("\n")
            delta += s.length
            result << s
          end

          robot.receive(channel)

          command.insert(shift + position, result)
          shift += delta
        end

        channel = Channel.new(robot, command, source)
        channel.command!

        channel.on_reply do |*strings|
          response.reply(strings.flatten.join("\n"))
        end

        robot.receive(channel)
      end

    protected

      ##
      # Message which allows subscription to the answers
      #
      class Channel < Message
        def reply(*strings)
          @on_reply.call(*strings) if @on_reply
        end

        def on_reply(&block)
          @on_reply = block
        end
      end

      # rubocop:disable AbcSize, CyclomaticComplexity
      # rubocop:disable MethodLength, PerceivedComplexity
      def parse(s)
        command = ''
        substs = {}
        last = nil
        i = 0
        deep = 0

        loop do
          case s[i]
          when nil then break

          when '$'
            if s[i + 1] == '('
              last = substs[command.length] = '' if deep == 0
              i += 1
              deep += 1
            else
              (deep > 0 ? last : command) << '$'
            end

          when ')'
            if deep > 0
              deep -= 1
            else
              command << ')'
            end

          else
            (deep > 0 ? last : command) << s[i]
          end

          i += 1
        end

        [command, substs]
      end

      Lita.register_handler(self)
    end
  end
end
