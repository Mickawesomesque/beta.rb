require "json"
require "logger"
require "net/http"

require_relative "betaseries"

Dir[File.dirname(__FILE__) + "/beta/*.rb"].each do |file|
  Beta.log "Including... #{file}"
  require file
end
