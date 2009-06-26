# test_setup.rb-files are recursive, from bottom to top
# In other words, they will look in the parent directory for another test_setup.rb file, until noone is found.
#
# This file should be the same everywhere. The action should take place
# in the optional file test_utilities_for_example_dir.rb (where 'example' should be the parent directory name)
#
# All test needs to include this line:
#
# require File.expand_path("#{File.dirname(__FILE__)}/test_setup")

context = File.expand_path(__FILE__)
parent = File.dirname(context)
parent_name = File.basename(parent)
grandparent = File.dirname(parent)

require 'osx/cocoa'
OSX::NSLog "Running test_setup: #{context}"

begin
  require File.join(parent, "test_utilities_for_#{parent_name}_dir")  # (Note: the ending _dir is mostly to
        # avoid getting 'test' as end, and risking having it run as a test.)
  rescue LoadError => e
    OSX::NSLog "No test_utilities_for_#{parent_name}_dir found in: '#{parent}'."
    OSX::NSLog "Error message: #{e}"
end

begin
  require File.join(grandparent, "test_setup")
rescue LoadError
  OSX::NSLog "End of chain. No test_setup found in: #{grandparent}"
end


