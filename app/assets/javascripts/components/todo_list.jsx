import React, { useState } from "react";

function TodoList(props) {
  const [name, setName] = useState("");
  const onChangeValue = (e) => {
    setName(e.target.value);
  }

  return (
    <React.Fragment>
      <input type="text" onChange={onChangeValue}/>
      <p> This is content: { name } </p>
      <ul>
          {props.todos.map(todo => {
              return (
                  <li>
                      { todo.text } - { todo.status }
                  </li>
              )
          })}
      </ul>
    </React.Fragment>
  );
}
