class TestController < ApplicationController
  
	layout false # ignore the layout

  def index
  	@test_index = "Some text."
  	@names = ['john', 'zenon', 'anna']
  end

  def hello
  end	
end
