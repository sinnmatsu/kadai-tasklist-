class TasksController < ApplicationController
  before_action :require_user_logged_in
  def index
    if logged_in?
    
      @tasks=current_user.tasks.all
      #ログインしているユーザーの全ての投稿データ
    end
  end

  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task は更新されませんでした'
      render :edit
    end
    
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end
  
  private

  def task_params
    params.require(:task).permit(:content,:title,:status)
    #POSTメソッドが発動するとparamsにそのまま代入される
    #parmasに代入する値をここで制限しておく
  end
end

