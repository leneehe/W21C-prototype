class ResourcesController < ApplicationController
  layout 'main/layout-blank'
  def index
    @internal_resources = Resource.all
  end

  def show
    @internal_resource = Resource.find(params[:id])
  end
end
