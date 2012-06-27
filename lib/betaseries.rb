module Beta
  @verbose = false

  def self.verbose=(value)
    @verbose = value
  end

  def self.log(message)
    puts "[Beta.rb #{Time.now}] #{message}" if @verbose
  end
end

class Hash
  def symbolize_keys!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key)
    end
    self
  end
end
