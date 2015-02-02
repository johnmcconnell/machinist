require 'attr_init'

def Machinist.lib_path
  File.dirname(__FILE__)
end

require 'require_all'
require_all File.join(Machinist.lib_path, 'machinist')

module Machinist
end
