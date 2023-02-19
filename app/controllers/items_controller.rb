class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # indexとshowアクションの場合を除き、ログインしていないユーザーはログイン画面へ促す

  def index
    @items = Item.all.order("created_at DESC") #item一覧をorderメソッドで降順表示
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :spec, :category_id, :condition_id, :postage_id, :prefecture_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end

end
