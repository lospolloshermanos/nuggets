class NuggetsController < ApplicationController
  before_action :set_nugget, only: [:show, :edit, :update, :destroy]
  layout 'nuggets'
  respond_to :html

  def index
    @nuggets = current_user.nuggets
    respond_with(@nuggets)
  end

  def show
    respond_with(@nugget)
  end

  def new
    @nugget = current_user.nuggets.build
    respond_with(@nugget)
  end

  def edit
  end

  def create
    @nugget = current_user.nuggets.build(nugget_params)
    @nugget.save
    respond_with(@nugget)
  end

  def update
    @nugget.update(nugget_params)
    respond_with(@nugget)
  end

  def destroy
    @nugget.destroy
    respond_with(@nugget)
  end

  def get_content
    if entry = Entry.get_entry(current_user.nuggets.find(params[:nugget]), params[:url])
      render json: entry, status: 200
    else
      render json: { error: 'Post not found' }, status: 422
    end
  end
  
  private
    def set_nugget
      @nugget = current_user.nuggets.find(params[:id])
    end

    def nugget_params
      params[:nugget].permit(:name, :rss)
    end
end
