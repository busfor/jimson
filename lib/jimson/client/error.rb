module Jimson
  class Client
    module Error
      class InvalidResponse < StandardError
        def initialize()
          super('Invalid or empty response from server.')
        end
      end

      class InvalidJSON < StandardError
        def initialize(json)
          super("Couldn't parse JSON string received from server:\n#{json}")
        end
      end

      class ServerError < StandardError
        def initialize(code, message, data)
          super("Server error #{code}: #{message}. Details: #{data.to_json}")
        end
      end
    end
  end
end
