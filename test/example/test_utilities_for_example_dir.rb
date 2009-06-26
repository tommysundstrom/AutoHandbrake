# test_utilities.rb is an optional file that should contain any code that is neede for all the files in this folder
# It is called by test_setup.
#
# I'm not sure it has any value, other than on the top level...'

context = File.expand_path(__FILE__)
parent = File.dirname(context)

require 'osx/cocoa'
OSX::NSLog "Running test_utilities: #{context}"

# If there is a test_utilities directory, it can be included like this:
# Dir[File.join(File.dirname(__FILE__), 'test_utilities/**/*.rb')].each do | f |
#   require f
# end