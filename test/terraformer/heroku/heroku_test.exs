defmodule Terraformer.HerokuTest do
  use Terraformer.DataCase

  alias Terraformer.Heroku
  alias Terraformer.Heroku.Projections.{Addon}

  describe "publish article" do
    setup do
      {:ok, uuid: UUID.uuid4()}
    end

    @tag :integration
    test "should succeed with valid data", %{uuid: uuid} do
      assert %Addon{} = addon = Heroku.provision_addon(%{uuid: uuid})
      # assert addon = %Addon{} = Terraformer.Repo.insert!(%Addon{uuid: uuid})
      assert addon.uuid == uuid
    end
  end
end
