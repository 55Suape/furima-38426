class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # indexとshowアクションの場合を除き、ログインしていないユーザーはログイン画面へ促す
  before_action :set_item, only: [:edit, :update, :show] # すでに存在しているレコードを選択し中身を書き換えるため、編集したいレコードを@tweetに代入しビューに受け渡す

  def index
    @items = Item.all.order('created_at DESC') # item一覧をorderメソッドで降順表示
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
  end

  # 出品ユーザー ≠ カレントユーザー の場合はトップページへ遷移
  def edit
    if @item.user == current_user
      render 'edit'
    else
      redirect_to root_path
    end
  end

  # 入力に不備がある場合は編集ページに留まる
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :spec, :category_id, :condition_id, :postage_id, :prefecture_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
