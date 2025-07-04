import axios from 'axios';

const alertApi = axios.create({
  baseURL: import.meta.env.VITE_ALERTS_URL,
});

export const fetchAlerts = async () => {
  const res = await alertApi.get('/');
  return res.data;
};

const authApi = axios.create({
  baseURL: import.meta.env.VITE_AUTH_URL,
});

export const login = async (username, password) => {
  const res = await authApi.post('/login', { username, password });
  return res.data;
};
