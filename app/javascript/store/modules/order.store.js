import { searchPartner, createOrder } from '../../Api/Order';

const initialState = () => ({
	customer: { name: '', phone: '', gender: false },
	products: [{ id: 1, name: 'Espresso đá', price: 15000, quantity: 1 }],
});

const state = initialState();

const getters = {};

const mutations = {
	updateCustomerInfo(state, object) {
		state.customer = { ...state.customer, [object.key]: object.value };
	},
	updateQuantityProduct(state, product) {
		const existProductIndex = state.products.findIndex((it) => it['id'] === product.id);
		if (existProductIndex !== -1) {
			state.products[existProductIndex] = product;
		} else state.products = [...state.products, product];
	},
};

const actions = {
	search_customer: ({ commit }, search_text) => {
		searchPartner(search_text).then((rsp) => {
			if (rsp.data) {
				const { name, gender } = rsp.data;
				commit('updateCustomerInfo', { key: 'gender', value: gender });
				commit('updateCustomerInfo', { key: 'name', value: name });
				commit('updateCustomerInfo', { key: 'phone', value: search_text });
			} else {
				commit('updateCustomerInfo', { key: 'name', value: '' });
				commit('updateCustomerInfo', { key: 'gender', value: false });
				commit('updateCustomerInfo', { key: 'phone', value: search_text });
			}
		});
	},
	create_order: ({ commit, state }) => {
		createOrder(state).then((rsp) => {
			if (rsp.data === true) {
				commit('updateCustomerInfo', { key: 'name', value: '' });
				commit('updateCustomerInfo', { key: 'gender', value: false });
				commit('updateCustomerInfo', { key: 'phone', value: '' });
			}
		});
	},
};

export default {
	namespaced: true,
	state,
	getters,
	mutations,
	actions,
};
