module TryRuby
  class Script
    def initialize(file)
      @position = 0

      @script = JSON.parse(File.read(file))
    end

    def messages
      @script["messages"]
    end

    def current_message
      messages[@position]
    end

    def current_body
       "\n" + current_message["body"] + "\n"
    end

    def current_title
      current_message["title"]
    end

    def continue?
      current_message["continue"]
    end

    def first
      @position = 0

      print current_body
    end

    def next
      @position += 1

      print current_body
    end

    def previous
      @position -= 1

      print current_body
    end
  end
end