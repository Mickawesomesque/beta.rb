module Beta
  class Error < StandardError
    attr_reader :error

    def initialize(answer, msg = nil)
      if msg.nil?
        @error = {
          code: answer[:errors]["error"]["code"],
          message: answer[:errors]["error"]["content"]
        }
      else
        @error = { code: nil, message: msg }
      end
    end

    def to_s
      "Error#{ @error[:code].nil? ? '' : ' ' + @error[:code].to_s }: #{@error[:message]}"
    end
  end
end
