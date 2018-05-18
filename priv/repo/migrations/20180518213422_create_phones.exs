defmodule ContactBook.Repo.Migrations.CreatePhones do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :number, :string
      add :contact_id, references(:contacts, on_delete: :nothing)

      timestamps()
    end

    create index(:phones, [:contact_id])
  end
end
