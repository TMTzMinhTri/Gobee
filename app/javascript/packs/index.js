import Vue from 'vue/dist/vue.esm';
import Antd from 'ant-design-vue';
import router from './routers';
import store from '../store/index';
import 'ant-design-vue/dist/antd.css';

Vue.use(Antd);

new Vue({
	router,
	store,
}).$mount('#index');
