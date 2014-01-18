module TryRuby
  class Script
    attr_reader :position

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

    alias :current :current_message

    def length
      messages.length
    end

    def continue?
      current_message.continue?
    end

    def intro
      messages.first
    end

    def outro
      messages.last
    end

    def last?
      @position == (length-1)
    end

    def first?
      @position == 0
    end

    def next
      @position += 1 unless last?
      current
    end

    def previous
      @position -= 1 unless first?
      current
    end
  end
end
