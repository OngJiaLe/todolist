defmodule Todolist.Sub_TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Sub_Tasks` context.
  """

  @doc """
  Generate a sub__task.
  """
  def sub__task_fixture(attrs \\ %{}) do
    {:ok, sub__task} =
      attrs
      |> Enum.into(%{
        task_name: "some task name",
        due_date: ~U[2023-08-14 15:45:00Z],
        priority: :low,
        task_id: Todolist.TasksFixtures.task_fixture().id
      })
      |> Todolist.Sub_Tasks.create_sub__task()

    sub__task
  end
end
