defmodule ResourcesQuantityTest do
  use Seelies.Test.DataCase


  test "Resources quantities can be added" do
    quantity = Seelies.ResourcesQuantity.add(%{"silver" => 300, "gold" => 200}, %{"bronze" => 100, "silver" => 200})
    assert quantity["bronze"] == 100
    assert quantity["silver"] == 500
    assert quantity["gold"] == 200
  end


  test "Resources quantities can be substracted" do
    quantity = Seelies.ResourcesQuantity.substract(%{"bronze" => 1000, "silver" => 300, "gold" => 200}, %{"silver" => 100, "gold" => 200})
    assert quantity["bronze"] == 1000
    assert quantity["silver"] == 200
    assert quantity["gold"] == 0
  end


  test "Resources comparision" do
    assert Seelies.ResourcesQuantity.has_enough?(%{"silver" => 100, "gold" => 200}, %{"silver" => 100, "gold" => 200})
    assert Seelies.ResourcesQuantity.has_enough?(%{"silver" => 200, "gold" => 200}, %{"silver" => 100, "gold" => 200})
    refute Seelies.ResourcesQuantity.has_enough?(%{"silver" => 100, "gold" => 200}, %{"silver" => 1000, "gold" => 200})
  end


  test "Weight the quantity according to coefficients defaulting to 1" do
    assert Seelies.ResourcesQuantity.weight(%{"gold" => 100, "silver" => 100, "bronze" => 100}, %{"gold" => 2, "silver" => 0.5, "bronze" => 0}) == %{"gold" => 200, "silver" => 50, "bronze" => 0}
    assert Seelies.ResourcesQuantity.weight(%{"gold" => 100, "silver" => 100, "bronze" => 100}, %{"gold" => 1.5}) == %{"gold" => 150, "silver" => 100, "bronze" => 100}
    assert Seelies.ResourcesQuantity.weight(%{"silver" => 100, "bronze" => 100}, %{"gold" => 1.5}) == %{"silver" => 100, "bronze" => 100}
  end
end
