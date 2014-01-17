module TryRuby
  class Script
    def initialize(filename)
      @position = 0

      @script = JSON.parse(File.read(filename))
    end

    def messages
      @messages ||= @script["messages"].map {|attributes| Message.new(attributes)}
    end

    def current_message
      messages[@position]
    end

    def current_body
       "\n" + current_message.body + "\n"
    end

    def current_title
      current_message.title
    end

    def continue?
      current_message.continue?
    end

    def intro
      messages.first.tap do |message|
        puts message.title
        puts message.body
      end
    end

    def next
      @position += 1

      print current_body
    end

    def previous
      @position -= 1

      print current_body
    end

    def outro
      messages.last.tap do |message|
        puts message.title
        puts message.body
      end
    end
  end
end
