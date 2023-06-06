defmodule StoreManagementSystemWeb.ProductLive.Index do
  use StoreManagementSystemWeb, :live_view

  alias StoreManagementSystem.SMS
  alias StoreManagementSystem.Repo
  alias StoreManagementSystem.SMS.Product

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :products, SMS.list_products())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, SMS.get_product!(id))
    |> assign(:stores, SMS.list_stores())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
    |> assign(:stores, SMS.list_stores())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  @impl true
  def handle_info({StoreManagementSystemWeb.ProductLive.FormComponent, {:saved, product}}, socket) do
    IO.inspect(product, label: "IN HANDLE INFO")
    {:noreply, stream_insert(socket, :products, product |> Repo.preload(:store, force: true))}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    product = SMS.get_product!(id)
    {:ok, _} = SMS.delete_product(product)

    {:noreply, stream_delete(socket, :products, product)}
  end
end
