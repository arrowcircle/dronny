class BuildsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @builds = scope.all#.page(params[:page])
  end

  def show
    @build = scope.find(params[:id])
  end

  def destroy
    @build = edit_scope.find(params[:id])
    redirect_to @build, notice: t('.build_deleted')
  end

  def new
    @build = current_user.builds.build
    render 'edit'
  end

  def create
    @build = current_user.builds.build(build_params)
    if @build.save
      redirect_to @build, notice: t('.build_created')
    else
      render 'edit'
    end
  end

  def edit
    @build = edit_scope.find(params[:id])
  end

  def update
    @build = edit_scope.find(params[:id])
    if @build.update(build_params)
      redirect_to @build, notice: t('.build_updated')
    else
      render 'edit'
    end
  end

  private

  def edit_scope
    return Build.none unless user_signed_in?
    return Build if current_user.admin?
    current_user.builds
  end

  def scope
    Build
  end

  def build_params
    params[:build].permit!
  end
end
