import React, { FC } from "react";

import ChatProps from "./ChatProps";

const Chat: FC<ChatProps> = ({ messages, addMessage }) => {
  const [inputValue, setInputValue] = React.useState("");

  const handleAddMessage = (ev: React.FormEvent<HTMLFormElement>) => {
    ev.preventDefault();

    if (!inputValue) return;
    addMessage(inputValue);
    setInputValue("");
  };

  return (
    <div>
      <h1>Chat Messages</h1>
      <ul>
        {messages?.map((message, index) => (
          <li key={message}>{message}</li>
        ))}
      </ul>
      <form onSubmit={handleAddMessage}>
        <input
          type="text"
          name="message"
          placeholder="Type a message..."
          value={inputValue}
          onChange={(event) => setInputValue(event.target.value)}
        />
        <button type="submit">Add</button>
      </form>

      <footer id="footer"></footer>
    </div>
  );
};

export default Chat;
