defmodule Todolist.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :task_name, :string, null: false
      add :due_date, :date
      add :priority, :string
      timestamps()
    end

    create index(:tasks, [:task_name])
  end
end
