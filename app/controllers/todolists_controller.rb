class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
    # ---- ここからコードを書きましょう ---- #
  def create
    # １. データを新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      # ３．詳細画面へリダイレクト
      redirect_to todolist_path(@list.id)
    else
      # ４．新規投稿画面を再表示
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update

    # ---- ここからコードを書きましょう ---- #
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to todolist_path(@list.id)
    else
      render :edit, status: :unprocessable_entity
    end  
    # ---- ここまでのあいだにコードを書きましょう ---- #

  end
  
  def destroy
    # ---- ここからコードを書きましょう ---- #
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path, status: :see_other  # 投稿一覧画面へリダイレクト
    # ---- ここまでのあいだにコードを書きましょう ---
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  # ---- ここまでのあいだにコードを書きましょう ---- #
end
