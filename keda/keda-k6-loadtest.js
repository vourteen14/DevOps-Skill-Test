import http from 'k6/http';
import { check } from 'k6';

export const options = {
  vus: 200,
  duration: '600s',
};

export default function () {
  const url = 'https://app2.angga-sr.xyz/echo';
  const payload = JSON.stringify({ data: 'Hello, world!' });

  const params = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  const res = http.post(url, payload, params);

  check(res, {
    'status is 200': (r) => r.status === 200,
  });
}
