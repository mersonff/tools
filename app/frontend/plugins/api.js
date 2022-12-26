function Api() {}

Api.prototype.call = function(request) {
  return new Promise((resolve) => {
    request.then((response) => {
      resolve(response);
    })
  })
}

Api.prototype.install = function (app) {
  app.plugin = this;
  app.config.globalProperties.$api = this;
}

export function createApi(args) {
  args.handler.defaults.baseURL = 'http://localhost:3000';
  args.handler.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  args.handler.defaults.headers.common['Content-Type'] = 'application/json';
  args.handler.defaults.headers.common['Accept'] = 'application/json';
  args.handler.defaults.responseType = 'json';
  args.handler.interceptors.response.use(
    (response) => {
      return response;
    },
    (error) => {
      switch (error.response.status) {

      }
   
      return Promise.reject(error);
    }
  );

  return new Api();
}