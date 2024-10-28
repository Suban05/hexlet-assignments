require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @task = Task.new(
      name: "Task",
      description: "Description",
      status: "created",
      creator: "Creator",
      performer: "Performer",
      completed: true,    
    )
  end

  test "task is valid" do
    task = Task.new(
      name: "Task",
      description: "Description",
      status: "created",
      creator: "Creator",
      performer: "Performer",
      completed: true,    
    )
    assert task.valid?
  end

  test "name is required" do
    @task.name = nil
    assert_not @task.valid?
  end

  test "status is required" do
    @task.status = nil
    assert_not @task.valid?
  end

  test "creator is required" do
    @task.creator = nil
    assert_not @task.valid?    
  end

  test "completed is required" do
    @task.completed = nil
    assert_not @task.valid?    
  end
end
