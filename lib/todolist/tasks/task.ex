defmodule Todolist.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :task_name, :string
    field :due_date, :utc_datetime
    field :priority, Ecto.Enum, values: [:low, :medium, :high], default: :low
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [
      :task_name,
      :due_date,
      :priority
    ])
    |> validate_required([:task_name])
  end
end
