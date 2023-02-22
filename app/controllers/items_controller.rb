class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # indexとshowアクションの場合を除き、ログインしていないユーザーはログイン画面へ促す
  before_action :set_item, only: [:edit, :update, :show, :destroy] # すでに存在しているレコードを選択し中身を書き換えるため、編集したいレコードを@itemに代入しビューに受け渡す
  before_action :user_check, only: [:edit, :destroy] # 出品ユーザー ≠ カレントユーザーの場合はトップページへ遷移

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

  # 出品ユーザー = カレントユーザー且つSold Outになっていない場合は編集画面へ遷移、それ以外はトップページへ遷移
  def edit
    if @item.order.nil?
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

  # 削除してトップページへ遷移
  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :spec, :category_id, :condition_id, :postage_id, :prefecture_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_check
    @user = @item.user
    redirect_to(root_path) unless @user == current_user
  end

end
