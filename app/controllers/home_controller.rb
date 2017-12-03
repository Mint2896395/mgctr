class HomeController < ApplicationController
  def index
    @sections = Section.all
  end
  
  def about
    @sections = Section.all
  end
end
