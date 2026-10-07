import http from 'k6/http';
export const options = { vus: 200, duration: '20s', noConnectionReuse: true };
export default function () { http.get('http://twoja.local/'); }
