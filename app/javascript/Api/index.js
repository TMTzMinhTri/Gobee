export const Api = {
  httpRequest(method, url, body) {
    return new Promise((resolve) => {
      fetch(url, {
        method,
        body: body ? JSON.stringify(body) : null,
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
      })
        .then((rsp) => rsp.json())
        .then((data) => resolve(data));
    });
  },
  get(url) {
    return this.httpRequest('GET', url);
  },
  post(url, body) {
    return this.httpRequest('POST', url, body);
  },
  delete(url) {
    return this.httpRequest('DELETE', url);
  },
  put(url, body) {
    return this.httpRequest('PUT', url, body);
  },
};
