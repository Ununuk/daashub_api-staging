$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'daashub_api'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/casettes'
  c.hook_into :webmock
end
