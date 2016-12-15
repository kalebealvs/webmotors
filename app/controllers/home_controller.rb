class HomeController < ApplicationController
  def index
    Make.populate_from_webmotors
    @makes = Make.all
  end
end
