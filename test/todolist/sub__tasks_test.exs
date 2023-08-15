defmodule Todolist.Sub_TasksTest do
  use Todolist.DataCase

  alias Todolist.Sub_Tasks

  describe "sub_tasks" do
    alias Todolist.Sub_Tasks.Sub_Task

    import Todolist.Sub_TasksFixtures

    @invalid_attrs %{
      sub_task_name: nil,
      task_id: nil
    }

    test "list_sub_tasks/0 returns all sub_tasks" do
      sub__task = sub__task_fixture()
      assert Sub_Tasks.list_sub_tasks() == [sub__task]
    end

    test "get_sub__task!/1 returns the sub__task with given id" do
      sub__task = sub__task_fixture()
      assert Sub_Tasks.get_sub__task!(sub__task.id) == sub__task
    end

    test "create_sub__task/1 with valid data creates a sub__task" do
      valid_attrs = %{
        task_name: "some task name",
        due_date: ~U[2023-08-14 15:45:00Z],
        priority: :low,
        task_id: Todolist.TasksFixtures.task_fixture().id
      }

      assert {:ok, %Sub_Task{} = sub__task} = Sub_Tasks.create_sub__task(valid_attrs)
    end

    test "create_sub__task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sub_Tasks.create_sub__task(@invalid_attrs)
    end

    test "update_sub__task/2 with valid data updates the sub__task" do
      sub__task = sub__task_fixture()
      update_attrs = %{}

      assert {:ok, %Sub_Task{} = sub__task} = Sub_Tasks.update_sub__task(sub__task, update_attrs)
    end

    test "update_sub__task/2 with invalid data returns error changeset" do
      sub__task = sub__task_fixture()
      assert {:error, %Ecto.Changeset{}} = Sub_Tasks.update_sub__task(sub__task, @invalid_attrs)
      assert sub__task == Sub_Tasks.get_sub__task!(sub__task.id)
    end

    test "delete_sub__task/1 deletes the sub__task" do
      sub__task = sub__task_fixture()
      assert {:ok, %Sub_Task{}} = Sub_Tasks.delete_sub__task(sub__task)
      assert_raise Ecto.NoResultsError, fn -> Sub_Tasks.get_sub__task!(sub__task.id) end
    end

    test "change_sub__task/1 returns a sub__task changeset" do
      sub__task = sub__task_fixture()
      assert %Ecto.Changeset{} = Sub_Tasks.change_sub__task(sub__task)
    end
  end
end
