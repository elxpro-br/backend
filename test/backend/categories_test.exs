defmodule Backend.CategoriesTest do
  use Backend.DataCase
  alias Backend.Categories
  alias Backend.Categories.Category

  test "give a call to list categories return all" do
    assert Categories.all() == []
  end

  test "give informations about categories should create one" do
    payload = %{
      name: "Sport",
      description:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam similique quas, aliquid cumque labore esse possimus blanditiis eveniet in ipsam!"
    }

    assert {:ok, %Category{} = category} = Categories.create(payload)
    assert category.name == payload.name
    assert category.description == payload.description
  end
end
