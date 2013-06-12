class AboutController < ApplicationController
  def about
	render params[:about]
  end
end