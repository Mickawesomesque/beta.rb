module Beta
  @verbose = false

  def self.verbose=(value)
    @verbose = value
  end

  def self.log(message)
    puts "[Beta.rb #{Time.now}] #{message}" if @verbose
  end
end
