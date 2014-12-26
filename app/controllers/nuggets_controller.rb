class NuggetsController < ApplicationController
  before_action :set_nugget, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @nuggets = Nugget.all
    respond_with(@nuggets)
  end

  def show
    respond_with(@nugget)
  end

  def new
    @nugget = Nugget.new
    respond_with(@nugget)
  end

  def edit
  end

  def create
    @nugget = Nugget.new(nugget_params)
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

  private
    def set_nugget
      @nugget = Nugget.find(params[:id])
    end

    def nugget_params
      params[:nugget]
    end
end
