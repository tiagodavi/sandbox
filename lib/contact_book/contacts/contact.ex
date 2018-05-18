defmodule ContactBook.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset


  schema "contacts" do
    field :first_name, :string
    field :last_name, :string
    has_many :phones, ContactBook.Phone, on_delete: :delete_all
    has_many :emails, ContactBook.Email, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
    |> cast_assoc(:phones, required: true)
    |> cast_assoc(:emails, required: true)
  end
end
