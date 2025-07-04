import React, { useState } from 'react';
import ReactDOM from 'react-dom/client';
import App from './App.jsx';
import Login from './Login.jsx';

function Root() {
  const [token, setToken] = useState(localStorage.getItem('token'));

  const handleLogin = (newToken) => {
    localStorage.setItem('token', newToken);
    setToken(newToken);
  };

  if (!token) {
    return <Login onLogin={handleLogin} />;
  }

  return <App />;
}

ReactDOM.createRoot(document.getElementById('root')).render(<Root />);
