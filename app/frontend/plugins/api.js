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
  args.handler.defaults.baseURL = `${window.location.protocol}/api/${args.namespace}/`;
  args.handler.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
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