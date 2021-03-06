alias Seelies.Board

defmodule Seelies.Test do
  def board() do
    Board.new()
      |> Board.add_area("a1")
      |> Board.add_area("a2")
      |> Board.add_area("a3")
      |> Board.add_area("a4")
      |> Board.add_deposit("a1", "d1", "gold")
      |> Board.add_deposit("a1", "d2", "silver")
      |> Board.add_deposit("a2", "d3", "gold")
      |> Board.add_deposit("a3", "d4", "gold")
      |> Board.add_deposit("a4", "d5", "silver")
      |> Board.add_territory("t1", ["a1", "a2"])
      |> Board.add_territory("t2", ["a2", "a3"])
      |> Board.add_territory("t3", ["a3", "a4"])
      |> Board.add_territory("t4", ["a2", "a3", "a4"])
      |> Board.add_territory("t5", ["a1", "a2", "a4"])
      |> Board.add_route("t1", "t2", 9)
      |> Board.add_route("t1", "t3", 15)
      |> Board.add_route("t1", "t5", 5)
      |> Board.add_route("t2", "t3", 4)
      |> Board.add_route("t2", "t4", 4)
      |> Board.add_route("t3", "t4", 2)
      |> Board.add_route("t3", "t5", 5)
      |> Board.add_route("t4", "t5", 1)
      |> Board.add_species("a1", ["ant", "beetle"])
      |> Board.add_species("a2", ["ant"])
      |> Board.add_species("a3", ["beetle"])
      |> Board.add_species("a4", ["wasp"])
  end


  def two_teams() do
    [
      %{"id" => "red", "player_ids" => ["p1"]},
      %{"id" => "blue", "player_ids" => ["p2"]}
    ]
  end

  def one_team() do
    [
      %{"id" => "red", "player_ids" => ["p1"]}
    ]
  end
end
