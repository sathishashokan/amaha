class TasksController < ApplicationController
    STATUS = ['Backlog', 'In-progress', 'Done']
    def new
        @task = Task.new
        @status = STATUS
    end

    def create
        task = Task.new(task_params.merge(user_id: current_user.id))
        if task.save
            flash[:notice] = "Task created!"
            redirect_to user_profile_path
        else
            flash[:alert] = "Task not created!"
            redirect_to new_task_path
        end
    end

    def edit
        @task = Task.find_by_id(params[:id])
        @status = STATUS
    end

    def update
        @task = Task.find_by_id(params[:id])
        if @task.update(task_params.merge(user_id: current_user.id))
        redirect_to user_profile_path
        else
        render :edit
        end
    end

    private

    def task_params
        params.require(:task).permit(:name, :description, :deadline, :status)
    end
end
