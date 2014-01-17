module TryRuby
  class REPL
    def initialize(options={})
      @options = options
    end

    def script
      @script ||= Script.new("scripts/default.json")
    end

    def start
      print "Hello! Interactive ruby ready.\n"
      puts script.current_title
      puts script.current_body

      while command = Readline.readline("> ", true)
        # print instructions if code == 'help'

        case command
        when "help"
          puts "Soon, I will have help for you."
        when "next", "continue"
          script.next
        when "prev", "previous", "back"
          script.previous
        when "exit"
          print "Goodbye, I hope you had fun!\n"
          exit 0
        else
          begin
            result = eval(command)

            puts "=> #{result}"

            script.next if script.continue?
          rescue SyntaxError
            puts "Oops, seems to have been some error. Care to try again?"

            next
          rescue NameError
            puts "Oops, you tried to use a method or variable that doesn't exist. Care to try again?"

            next
          end
        end
      end
    end
  end
end