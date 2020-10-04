import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';

import Order from '../Screens/Order/index.vue';

Vue.use(VueRouter);

const routes = [
	{
		path: '/',
		component: Order,
	},
];

const router = new VueRouter({
	routes,
	mode: 'history',
});
export default router;
