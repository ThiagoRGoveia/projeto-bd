import Vue from 'vue'
import App from './App.vue'
import httpRequest from './services/api'
import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
import columnFormater from './services/column-formater'

Vue.config.productionTip = false
Vue.prototype.$http = httpRequest()
Vue.prototype.$columnFormater = columnFormater
Vue.use(Buefy)
new Vue({
  render: h => h(App),
}).$mount('#app')
