// frontend/web-dashboard/src/App.jsx
import { useEffect, useState } from 'react';
import './App.css';
import { fetchAlerts } from './services/api';

function App() {
  const [alerts, setAlerts] = useState([]);

  useEffect(() => {
    const load = async () => {
      try {
        const data = await fetchAlerts();
        setAlerts(data);
      } catch (err) {
        console.error('Failed to fetch alerts', err);
      }
    };
    load();
  }, []);

  return (
    <div className="App">
      <h1>DEASLA Web Dashboard</h1>
      <ul>
        {alerts.map(alert => (
          <li key={alert.id}>{alert.message} ({alert.type})</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
