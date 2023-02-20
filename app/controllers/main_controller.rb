class MainController < ApplicationController
  def index
    # render "index"
  end

  def hello
    redirect_to(action: 'index')
  end
end
