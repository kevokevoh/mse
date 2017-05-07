defmodule MseWeb.Web.Admin.Imports.CardController do
  use MseWeb.Web, :controller
  import ExAdmin.Utils

  def update(conn, _params) do
    Mtgio.Cards.import

    redirect(conn, to: admin_path)
  end
end
