defmodule Todolist.Sub_Tasks.Sub_Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sub_tasks" do
    belongs_to :task, Todolist.Tasks.Task
    field :task_name, :string
    field :due_date, :utc_datetime
    field :priority, Ecto.Enum, values: [:low, :medium, :high], default: :low

    timestamps()
  end

  @doc false
  def changeset(sub__task, attrs) do
    sub__task
    |> cast(attrs, [
      :task_name,
      :due_date,
      :priority,
      :task_id
    ])
    |> validate_required([
      :task_name,
      :task_id
    ])
  end
end
