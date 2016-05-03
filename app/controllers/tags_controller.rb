class TagsController < ApplicationController

  def index
    @tags = Tag.order('created_at DESC')
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end