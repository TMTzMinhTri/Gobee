import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
import orderModule from './modules/order.store';

Vue.use(Vuex);

const store = new Vuex.Store({
	modules: {
		order: orderModule,
	},
	strict: process.env.NODE_ENV !== 'production',
});

export default store;
