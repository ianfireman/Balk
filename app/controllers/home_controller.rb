class HomeController < ApplicationController
  layout "formL", except: [:admin]
  
  def index
  end
  
  def admin
  end
end
