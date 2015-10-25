# This should be on the top of the file
require 'simplecov'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lita-substitution'

require 'lita/rspec'

# A compatibility mode is provided for older plugins upgrading from Lita 3.
# Since this plugin was generated with Lita 4,
# the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false
