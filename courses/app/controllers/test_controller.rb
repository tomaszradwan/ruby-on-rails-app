class TestController < ApplicationController
  
	layout false # ignore the layout

  def index
  	@test_index = "Some text."
  	@names = ['john', 'zenon', 'anna']

  	@id = params[:id].to_i
  	@page = params[:page].to_i
  end

  def hello
  end	
end
