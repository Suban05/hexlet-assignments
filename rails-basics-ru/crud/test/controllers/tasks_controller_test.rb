require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @task = tasks(:one)
  end

  test "gets new" do
    get new_task_path
  end

  test "creates a task" do
    assert_difference "Task.count" do
      post tasks_path, params: { task: { name: "hello", description: "I'm just a task", status: "created", "creator": "B.G", completed: false } }
      assert_redirected_to Task.find_by(name: "hello")
    end
  end

  test "updates a task" do
    patch task_path(@task), params: { task: { name: "hello" } }
    @task.reload
    assert_equal("hello", @task.name)
  end

  test "shows a task" do
    get task_path(@task)
    assert_response :success
  end

  test "deletes a task" do
    assert_difference "Task.count", -1 do
      @task.delete
    end
  end
end
