defmodule BackendWeb.CategoryView do
  use BackendWeb, :view

  def render("index.json", %{categories: cateogies}) do
    render_many(cateogies, __MODULE__, "category.json")
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      name: category.name,
      description: category.description,
    }
  end
end
