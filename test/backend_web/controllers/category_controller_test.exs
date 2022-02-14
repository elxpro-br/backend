defmodule BackendWeb.CategoryControllerTest do
  use BackendWeb.ConnCase
  alias Backend.Categories

  describe "categories" do
    test "list all categories", %{conn: conn} do
      conn = get(conn, Routes.category_path(conn, :index))
      assert json_response(conn, 200) == []
    end

    test "should create a category", %{conn: conn} do
      category = %{name: "Sport", description: "pumpkin"}
      conn = post(conn, Routes.category_path(conn, :create, category: category))
      assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, Routes.category_path(conn, :show, id))

      assert %{"id" => ^id, "description" => "pumpkin", "name" => "SPORT"} =
               json_response(conn, 200)
    end

    test "should throw when a category already exist", %{conn: conn} do
      category = %{name: "Sport", description: "pumpkin"}
      Categories.create(category)
      conn = post(conn, Routes.category_path(conn, :create, category: category))
      assert "has already been taken" in json_response(conn, 422)["errors"]["name"]
    end
  end
end
