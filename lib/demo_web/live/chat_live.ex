defmodule DemoWeb.ChatLive do
  use Phoenix.LiveView

  alias DemoWeb.{Endpoint}

  @messages_topic "messages"

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Endpoint.subscribe(@messages_topic)
    end

    socket = assign(socket, messages: [])

    {:ok, socket}
  end

  def handle_event("phx.add-message", %{"message" => message}, socket) do
    Endpoint.broadcast(@messages_topic, "react.add-message", %{
      messages: [message | socket.assigns.messages]
    })

    {:noreply, socket}
  end

  def handle_info(
        %{event: "react.add-message", payload: %{messages: messages}},
        socket
      ) do
    socket = assign(socket, messages: messages)

    {:noreply, push_event(socket, "react.add-message", %{messages: messages})}
  end
end

# Oops! It seems there's an issue connecting to your application. Please follow the instructions listed in the task and ensure your application is running.


# and when the server wants to push messages to the clients subscribed to a topic,
