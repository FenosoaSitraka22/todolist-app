class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category

    if @task.save
      respond_to do |format|
       format.html{redirect_to root_path}
       format.js {}
       flash[:notice] = "Task created"
      end  
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    puts "*"*90
    puts params[:ok]
    @task = Task.find(params[:id])
    @task.update(status: params[:ok])
   respond_to do |format|
       format.html{redirect_to root_path}
       format.js {}
    end
    flash[:notice] = "Task edited"
  end

  def index
    @tasks = Task.all
  end

  def destroy

    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
       format.html{redirect_to root_path}
       format.js {}
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
