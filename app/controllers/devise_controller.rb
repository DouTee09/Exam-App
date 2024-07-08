class DeviseController < ApplicationController
  def resource_name
    devise_mapping.name
  end
  alias :scope_name :resource_name
end
