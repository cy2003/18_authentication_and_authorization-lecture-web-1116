class CookiesController < ApplicationController

  def index
  end

  def name
    cookies[:name] = params[:name]
    redirect_to '/cookies'
  end
end
