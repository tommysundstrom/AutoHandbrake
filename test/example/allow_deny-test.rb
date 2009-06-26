#
#  HelloWorld-test.rb
#  TemplateProject
#
#  Created by Tommy Sundström on 4/3-09.
#  Copyright (c) 2009 Helt Enkelt ab. All rights reserved.
#

require File.expand_path("#{File.dirname(__FILE__)}/test_setup")



class TC_HelloWorld_test < Test::Unit::TestCase
  def setup
    # Log.debug "Sets up a #{File.basename(__FILE__)} test."
  end

  context "Retorical tests - " do
    should "Assert true." do
      assert{true}
    end
    
    should "Deny false." do
      deny{false}
    end
    
    #should "Fail this." do
    #   assert {false}
    #end
  end
end
