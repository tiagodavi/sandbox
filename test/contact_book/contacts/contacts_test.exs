defmodule ContactBook.ContactsTest do
  use ContactBook.DataCase

  alias ContactBook.Contacts

  describe "contacts" do
    alias ContactBook.Contacts.Contact

    @valid_attrs %{
      first_name: "some first_name",
      last_name: "some last_name",
      emails: [%{email: "test@test.com"}],
      phones: [%{number: "00000000"}],
    }

    @update_attrs %{
      first_name: "some updated first_name",
      last_name: "some updated last_name"
    }

    @invalid_attrs %{first_name: nil, last_name: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_contact()

      contact
    end



    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Contacts.create_contact(@valid_attrs)
      assert contact.first_name == "some first_name"
      assert contact.last_name == "some last_name"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, contact} = Contacts.update_contact(contact, @update_attrs)
      assert %Contact{} = contact
      assert contact.first_name == "some updated first_name"
      assert contact.last_name == "some updated last_name"
    end

  
    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end
end
