class BuildsController < ApplicationController

  def index
    @builds = Build.order('created_at DESC')
  end

  def show
    @build = Build.find(params[:id])
  end

  def new
    @build = Build.new
  end

  def create
    @build = Build.new(build_params)
    if @build.save
      redirect_to @build
    else
      render 'new'
    end
  end

  def edit
    @build = Build.find(params[:id])
  end

  def update
    @build = Build.find(params[:id])

    if @build.update(build_params)
      redirect_to @build
    else
      render 'edit'
    end
  end

  def destroy
    @build = Build.find(params[:id])
    @build.destroy

    redirect_to root_path
  end

  def withtag
    if params[:tagname]
      @builds = Build.tagged_with(params[:tagname]).order('created_at DESC')
      @tagname = params[:tagname]
    end
  end

  private
    def build_params
      params.require(:build).permit(:title, :tag_line, :description)
    end
end
