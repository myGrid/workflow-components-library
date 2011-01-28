require 'array'
require 'numeric'
require 'string'
require 'super_struct'
require 'uuid_as_id'
require 'addressable/uri'
require 'has_submitter'
require 'has_version_field'

# FIXME: move this to a configuration file
module AppConfig
  BASE_URL = "http://localhost:3000/" 
end