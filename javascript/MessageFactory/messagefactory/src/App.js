import React from 'react';
import './App.css';
import Worker from './worker/worker';

function App() {
  Worker(0);
  const [count, changeCount] = React.useState(0);

  var receiveMessage = (event) => {
    console.log(event);
    changeCount(event.data.count);
  }

  window.addEventListener('message', receiveMessage, false);

  return (
    <div className="App">
     <p>{count}</p>
    </div>
  );
}

export default App;
