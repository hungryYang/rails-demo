class ListController < ApplicationController
  def index
    @list = List.all
  end

  def read
    @item = List.find(params[:id])
  end

  def add 
    @item = List.new
  end

  def create
    @item = List.new(getFormData)
    @item.save 

    redirect_to :action => :index
  end
  def delete
    @item = List.find(params[:id])
    @item.destroy

    redirect_to :action => :index
  end

  def edit
    @item = List.find(params[:id])
  end

  def update
    @item = List.find(params[:id])
    @item.update(getFormData)
    redirect_to :action=>:read,:id => @item
  end

  def search
    codition = params[:condition]
    @item = List.find_by_sql("select * from lists where title like '#{codition}%'")
  end

  private

  def getFormData
    params.require(:list).permit(:title,:description)
  end
end
