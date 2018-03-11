defmodule Terraformer.HerokuTest do
  use Terraformer.DataCase
  import Commanded.Assertions.EventAssertions

  alias Terraformer.Heroku
  alias Terraformer.Heroku.Projections.{Addon}
  alias Terraformer.Heroku.Events.{AddonProvisioned, AddonDeprovisioned, VaultAttached}

  describe "addon operations" do
    setup do
      {:ok, uuid: UUID.uuid4()}
    end

    test "provision / deprovision should succeed with valid data", %{uuid: uuid} do
      assert %Addon{} = addon = Heroku.provision_addon(%{uuid: uuid})
      assert addon.uuid == uuid
      assert_receive_event(AddonProvisioned, &IO.inspect/1)

      assert :ok == Heroku.attach_vault(%{uuid: uuid, vault_id: UUID.uuid4()})
      assert_receive_event(VaultAttached, &IO.inspect/1)

      assert :ok == Heroku.deprovision_addon(%{uuid: uuid})
      assert_receive_event(AddonDeprovisioned, &IO.inspect/1)
    end
  end
end
