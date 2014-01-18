module TryRuby
  Message = Struct.new(:title, :body, :continue) do

    def initialize(attributes={})
      super(*attributes.values_at(*members.map(&:to_s)))
    end

    alias :continue? :continue

    def formatted
      [title, body]
    end
  end
end
