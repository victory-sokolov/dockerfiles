import http from 'k6/http';
import { check, sleep } from 'k6';

const TARGET_URL = __ENV.TARGET_URL || 'https://test-api.k6.io';

export const options = {
    stages: [
        { duration: '1m', target: 10 },
        { duration: '3m', target: 10 },
        { duration: '1m', target: 0 },
    ],
    thresholds: {
        http_req_duration: ['p(95)<500'],
    },
};

export default function () {
    const response = http.get(`${TARGET_URL}/public/`);

    check(response, {
        'status is 200': (r) => r.status === 200,
    });

    sleep(1);
}
