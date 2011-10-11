require 'ruby/reflection'

module Maglev
  class Reflection < Ruby::Reflection
  end
end

require 'maglev/reflection/mirror'
require 'maglev/reflection/object_mirror'
require 'maglev/reflection/field_mirror'
require 'maglev/reflection/thread_mirror'
require 'maglev/reflection/stack_frame_mirror'
require 'maglev/reflection/class_mirror'
require 'maglev/reflection/method_mirror'
