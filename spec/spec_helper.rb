mirror_api = ENV["MIRRORS"] || "ruby"

$:.push File.expand_path("..", __FILE__)
$:.push File.expand_path("../../lib", __FILE__)

require "#{mirror_api}/reflection"
include Object.const_get(mirror_api.capitalize)

require 'spec_helper/mspec_patch'
require 'spec_helper/multiple_reflections'

class PendingError < StandardError; end
MSpec.store :guarding_exceptions, [Reflection::CapabilitiesExceeded, PendingError]
def pending; raise PendingError; end
