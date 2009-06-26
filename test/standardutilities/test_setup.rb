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
# OSX::NSLog "Running test_setup: #{context}"

if parent_name == 'test' and File.exist?(File.join(grandparent, 'rb_main.rb'))
  # This is the top level of test.
  # OSX::NSLog "End of chain. Found top test dir."

  # Make utilities easy to load
  $LOAD_PATH << File.join(grandparent, 'app/utilities')
  $LOAD_PATH << File.join(grandparent, 'app/standardutilities')

  # Start the (almost) normal requiring of files, done by path-setting. (Note however that this path-setting is
  # not the same as the one in the root level. 
  require(File.join(parent, 'path-setting.rb'))
else
  begin
    require File.join(grandparent, "test_setup")
  rescue LoadError => e
    # OSX::NSLog "End of chain. No test_setup found in: #{grandparent}. Message: #{e}"
  end
end

