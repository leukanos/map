class KindsController < ApplicationController
  def index
    @kinds = Kind.by_name
    @kind  = Kind.new
  end

  def create
    @kind = Kind.new(kind_params)
    if @kind.save
      redirect_to kinds_path
      gflash success: t('kind.created')
    else
      @kinds = Kind.by_name
      render :index
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def kind_params
    params.require(:kind).permit(:name)
  end
end
