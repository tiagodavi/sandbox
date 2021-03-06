defmodule ContactBook.Email do
  use Ecto.Schema
  import Ecto.Changeset


  schema "emails" do
    field :email, :string
    field :contact_id, :id

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
