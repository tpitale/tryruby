module Tryruby
  class CLI
    attr_accessor :options

    def initialize(options = {})
      self.options = options
    end

    # def create_config_file
    #   # oauthy-bit, make a class

    #   # open a url
    #   `open 'https://api.put.io/v2/oauth2/authenticate?client_id=183&response_type=code&redirect_uri=#{Getit::REDIRECT}'`
    #   # stdin ask for code from the url
    #   print "Please paste what comes after the 'code=': "
    #   code = STDIN.gets

    #   # request access_token with code
    #   uri = URI.parse("https://api.put.io/v2/oauth2/access_token?client_id=#{Getit::ID}&client_secret=#{Getit::SECRET}&grant_type=authorization_code&redirect_uri=#{Getit::REDIRECT}&code=#{code}")
    #   http = Net::HTTP.new(uri.host, uri.port)
    #   http.use_ssl = true
    #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #   request = Net::HTTP::Get.new(uri.request_uri)

    #   response = http.request(request)

    #   new_access_token = ''

    #   if response.code.to_i == 200
    #     new_access_token = JSON.parse(response.body)['access_token']
    #   end

    #   # write file
    #   @config = {
    #     'access_token' => 'access_token',
    #     'last_accessed_at' => Time.now.to_i
    #   }

    #   write_config_file
    # end

    def script
      @script ||= Script.new("scripts/default.json")
    end

    def run
      print "Hello! Interactive ruby ready.\n"

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
          end
        end
      end
    end

    def self.run
      new(parse_options).run
    end

    def self.parse_options
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
        end.parse!

      end
    end
  end
end
