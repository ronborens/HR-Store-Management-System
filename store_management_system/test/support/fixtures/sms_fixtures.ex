defmodule StoreManagementSystem.SMSFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoreManagementSystem.SMS` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: "some location",
        storenum: 42
      })
      |> StoreManagementSystem.SMS.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventory_count: 42,
        name: "some name",
        retail_price: 120.5,
        vendor: "some vendor",
        wholesale_price: 120.5
      })
      |> StoreManagementSystem.SMS.create_product()

    product
  end
end
