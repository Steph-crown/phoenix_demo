defmodule DemoWeb.MessagesLive do
  use Phoenix.LiveView

  alias DemoWeb.{Endpoint}

  @messages_topic "messages"

  def mount(_params, _session, socket) do
    if(connected?(socket)) do
      Endpoint.subscribe(@messages_topic)
    end

    {:ok, socket |> assign(messages: [])}
  end

  def handle_info(%{event: "react.add-message", payload: %{messages: messages}}, socket) do
    IO.inspect("ayayayayayayay")
    IO.inspect(messages)
    {:noreply, socket |> assign(messages: messages)}
  end
end
