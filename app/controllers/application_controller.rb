class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def form_for(obj)
    unless obj.persisted?
      method = 'POST'
      action = "/#{obj.class.downcase.pluralize}"
    else
      method = 'PATCH'
      action = "/#{obj.class.downcase.pluralize}/#{obj.id}"
    end
    "<form method='#{method}' action='#{action}'>"
  end
end
