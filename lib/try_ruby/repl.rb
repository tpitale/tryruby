module TryRuby
  class REPL
    def initialize(options={})
      @options = options
    end

    def script
      @script ||= Script.new("scripts/default.json")
    end

    def start
      display "Hello! Interactive ruby ready."
      display script.intro.formatted

      while command = Readline.readline("> ", true)
        case command
        when "help"
          display "Soon, I will have help for you."
        when "next", "continue"
          display script.next.formatted
        when "prev", "previous", "back"
          display script.previous.formatted
        when "exit", "quit"
          break
        else
          process(command)
        end
      end

      display "Goodbye, I hope you had fun!\n"
    end

    def process(command)
      begin
        result = eval(command)

        display "=> #{result}"

        display(script.next.formatted) if script.continue?
      rescue SyntaxError
        display "Oops, seems to have been some error. Care to try again?"
      rescue NameError
        display "Oops, you tried to use a method or variable that doesn't exist. Care to try again?"
      end
    end

    def display(message)
      puts message
    end
  end
end