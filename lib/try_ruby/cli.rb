module TryRuby
  class CLI
    attr_accessor :options

    def initialize(args)
      self.options = parse_options(args)
    end

    def run
      TryRuby::REPL.new(options).start
    end

    private

    # @private
    def parse_options(args)
      {}.tap do |options|

        OptionParser.new do |opts|
          opts.banner = "Usage: tryruby [options]"

          # opts.on('-o', '--output DIRECTORY', 'Require the DIRECTORY to download into.') do |dir|
          #   options[:directory] = dir
          # end

          # opts.on('-p', '--path [PATH]', 'Path inside Put.io to download from.') do |path|
          #   options[:filter_path] = path
          # end

          # opts.on('-e', '--extension [EXTENSION]', 'File extension to filter and download.') do |ext|
          #   options[:filter_extension] = ext
          # end

          # opts.on('-m', '--move [PATH]', 'After downloading, move the file to this path on Put.io.') do |path|
          #   options[:move_to] = path
          # end

          # opts.on('--delete', 'After downloading, remove the file from Put.io. BE CAREFUL') do
          #   options[:delete] = true
          # end

          # opts.on('--reset', 'Reset the time since last downloaded. This will redownload anything that is not in the downloads directory.') do
          #   options[:reset_last_accessed_at] = true
          # end

          opts.on_tail("-h", "--help", "Show this message") do
            puts opts
            exit
          end
        end.parse!(args)

      end
    end
  end
end
