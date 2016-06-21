class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = scope.all
  end

  def show
  end

  def new
    @brand = Brand.new
    render 'edit'
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to @brand, notice: t('.brand_created')
    else
      render 'edit'
    end
  end

  def update
    if @brand.update(brand_params)
      redirect_to @brand, notice: t('.brand_updated')
    else
      render :edit
    end
  end

  def destroy
    # @brand.destroy
    redirect_to brands_url, notice: t('.brand_deleted')
  end

  private

  def scope
    Brand
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:title, :logo, :site)
  end
end
