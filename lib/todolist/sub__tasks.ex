defmodule Todolist.Sub_Tasks do
  @moduledoc """
  The Sub_Tasks context.
  """

  import Ecto.Query, warn: false
  alias Todolist.Repo

  alias Todolist.Sub_Tasks.Sub_Task

  @doc """
  Returns the list of sub_tasks.

  ## Examples

      iex> list_sub_tasks()
      [%Sub_Task{}, ...]

  """
  def list_sub_tasks do
    Repo.all(Sub_Task)
  end

  @doc """
  Gets a single sub__task.

  Raises `Ecto.NoResultsError` if the Sub  task does not exist.

  ## Examples

      iex> get_sub__task!(123)
      %Sub_Task{}

      iex> get_sub__task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sub__task!(id), do: Repo.get!(Sub_Task, id)

  @doc """
  Creates a sub__task.

  ## Examples

      iex> create_sub__task(%{field: value})
      {:ok, %Sub_Task{}}

      iex> create_sub__task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sub__task(attrs \\ %{}) do
    %Sub_Task{}
    |> Sub_Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sub__task.

  ## Examples

      iex> update_sub__task(sub__task, %{field: new_value})
      {:ok, %Sub_Task{}}

      iex> update_sub__task(sub__task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sub__task(%Sub_Task{} = sub__task, attrs) do
    sub__task
    |> Sub_Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sub__task.

  ## Examples

      iex> delete_sub__task(sub__task)
      {:ok, %Sub_Task{}}

      iex> delete_sub__task(sub__task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sub__task(%Sub_Task{} = sub__task) do
    Repo.delete(sub__task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sub__task changes.

  ## Examples

      iex> change_sub__task(sub__task)
      %Ecto.Changeset{data: %Sub_Task{}}

  """
  def change_sub__task(%Sub_Task{} = sub__task, attrs \\ %{}) do
    Sub_Task.changeset(sub__task, attrs)
  end
end
