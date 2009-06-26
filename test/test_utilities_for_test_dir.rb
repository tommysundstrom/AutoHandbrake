# test_utilities.rb is an optional file that should contain any code that is neede for all the files in this folder
# It is called by test_setup.
#
# I'm not sure it has any value, other than on the top level...'

context = File.expand_path(__FILE__)
parent = File.dirname(context)

require 'osx/cocoa'
OSX::NSLog "This is the top level test_utilities."
OSX::NSLog "Running test_utilities: #{context}"


# This is the test_utilities for the top level. It will require the stuff most tests need, etc.

# Require test-gems
require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'assert2'

# Loading the path-setting (this is quite costly in time, since it is done all the time - but it seams to be the
# best way to get a envirionment that equals the real thing). Note that the path-setting called here will call
# (and somewhat modify) the path-setting in the root.
begin
  require File.join(parent, 'path-setting.rb')
rescue LoadError => e
  OSX::NSLog "FAILED to require #{f}. Error: #{e}"
end

# =begin   # This should be handled by path-setting, so no need. But for some reasin...
# If there is a test_utilities directory, it can be included like this:
# Dir[File.join(File.dirname(__FILE__), 'test_utilities/**/*.rb')].each do | f |
#   require f
# end

# Get everything in utilities (among other things, the log.rb)
Root = File.dirname(parent)
# let the utilities require each other
$LOAD_PATH << File.join(Root, 'app/utilities')
$LOAD_PATH << File.join(Root, 'app/standardutilities')
# Require all utilities
Dir[File.join(Root, 'app/utilities/**/*.rb')].each do | f |
  begin
    require f
  rescue LoadError => e
    OSX::NSLog "FAILED to require #{f}. Error: #{e}"    
  end
end
Dir[File.join(Root, 'app/standardutilities/**/*.rb')].each do | f |
  begin
    require f
  rescue LoadError => e
    OSX::NSLog "FAILED to require #{f}. Error: #{e}"
  end
end



# The code below makes the environment simular to when running the classes
#     Since rb_main_init requires *all* rb-files, and since this (as I understand it) runs for
#     every test case, it can make testing slow.
  #require 'rb_main'
  #rb_main_init


