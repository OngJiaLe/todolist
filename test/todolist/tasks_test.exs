defmodule Todolist.TasksTest do
  use Todolist.DataCase

  alias Todolist.Tasks

  describe "tasks" do
    alias Todolist.Tasks.Task

    import Todolist.TasksFixtures

    @invalid_attrs %{
      task_name: nil
    }

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{
        task_name: "some task name",
        due_date: "~D[2023-8-14]",
        priority: :low
      }

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.task_name == "some task name"
      assert task.due_date == ~D[2023-08-14]
      assert task.priority == :low
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()

      update_attrs = %{
        task_name: "some updated task name",
        due_date: "~D[2023-9-14]",
        priority: :high
      }

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.task_name == "some updated task name"
      assert task.due_date == "~D[2023-9-14]"
      assert task.priority == :high
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
