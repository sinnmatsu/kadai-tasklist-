class TasksController < ApplicationController
  #before_actionはApplicationControllerでもいいし、このコントローラー内のメソッドを設定しても良い
  #before_actionは「事前にメソッドを発動することができるとオプションが付いているだけ」のこと
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :update]
  #destoryアクション、updataアクションを行う際に操作している投稿が本当に自分の投稿なのかどうかを確認するメソッド
  
  def index
    if logged_in?
      @tasks=current_user.tasks.all
      #自分のブラウザにログインしているユーザーのタスクを全て取得することができる。
    end
  end

  def show
    unless current_user.id==@task.user.id
      redirect_to root_url
    end
  end
  

  def new
    @task = current_user.tasks.build
  end
  

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'Message が正常に投稿されました'
      #keyとvalueの対のデータでsessionに保存することができる
      redirect_to @task
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def edit
    unless current_user.id==@task.user.id
      redirect_to root_url
    end
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = 'task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task は更新されませんでした'
      render :edit
    end
    
  end

  def destroy
    @task.destroy
    redirect_to root_url
  end
  
  private

  def task_params
    params.require(:task).permit(:content,:title,:status)
    #POSTメソッドが発動するとparamsにそのまま代入される
    #parmasに代入する値をここで制限しておく
  end
  
  def set_task
   @task = Task.find(params[:id])
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    #current_user.tasksとすることで、現在ログインしているユーザーの投稿のみに絞ることができる。
    unless @task
    #自分以外のtaskだった場合はnilが返ってくるのでfalseになる。
      redirect_to root_url
    end
  end
  
  
end

