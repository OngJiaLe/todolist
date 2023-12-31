defmodule Todolist.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        task_name: "some task name",
        due_date: ~U[2023-08-14 15:45:00Z],
        priority: :low
      })
      |> Todolist.Tasks.create_task()

    task
  end
end
