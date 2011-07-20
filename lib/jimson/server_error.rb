module Jimson
  module ServerError
    class Generic < Exception
      attr_accessor :code, :message

      def initialize(code, message)
        @code = code
        @message = message
        super(message)
      end

      def to_h
        {
          'code'    => @code,
          'message' => @message
        }
      end
    end

    class ParseError < Generic
      def initialize
        super(-32700, 'Invalid JSON was received by the server. An error occurred on the server while parsing the JSON text.')
      end
    end

    class InvalidRequest < Generic
      def initialize
        super(-32600, 'The JSON sent is not a valid Request object.')
      end
    end

    class MethodNotFound < Generic
      def initialize
        super(-32601, 'Method not found.')
      end
    end

    class InvalidParams < Generic
      def initialize
        super(-32602, 'Invalid method parameter(s).')
      end
    end

    class InternalError < Generic
      def initialize
        super(-32603, 'Internal server error.')
      end
    end

    class ApplicationError < Generic
      def initialize(err)
        super(-32099, "The application being served raised an error: #{err}")
      end
    end

    CODES = {
              -32700 => ParseError,
              -32600 => InvalidRequest,
              -32601 => MethodNotFound,
              -32602 => InvalidParams,
              -32603 => InternalError
            }
  end
end
