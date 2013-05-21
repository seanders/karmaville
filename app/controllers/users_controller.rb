class UsersController < ApplicationController
  def index
      if params[:page] == nil 
        @page = 1 
      else 
        @page = params[:page].to_i
      end
      @users = User.page(@page) 

      @page_count = User.max_page(50)
  end
end
