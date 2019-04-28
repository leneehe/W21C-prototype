class ResourcesController < ApplicationController
  layout 'main/layout-blank'
  def index
    @internal_resources = Resource.all
  end

  def show
    @internal_resource = Resource.find(params[:id])
  end

  def search_results
    if params[:search]
      @internal_resources = Resource.search(params[:search]).order("created_at DESC")
    else
      @internal_resources = nil
    end
  end

end
# loop through all the things