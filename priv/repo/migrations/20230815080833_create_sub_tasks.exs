defmodule Todolist.Repo.Migrations.CreateSubTasks do
  use Ecto.Migration

  def change do
    create table(:sub_tasks) do
      add :task_name, :string, null: false
      add :due_date, :utc_datetime
      add :priority, :string
      add :task_id, references(:tasks , on_delete: :nothing)
      timestamps()
    end

    create index(:sub_tasks, [:task_name])
  end
end
