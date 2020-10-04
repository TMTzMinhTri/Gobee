<template>
	<div :style="{ padding: '20px' }">
		<a-input-search placeholder="Số diện thoại" size="large" @change="onSearch" v-model="phoneNumber" :maxLength="10">
			<a-button slot="enterButton">
				<a-checkbox v-model="gender">
					Nam
				</a-checkbox>
			</a-button>
		</a-input-search>

		<a-input-search placeholder="Tên khách hàng" size="large" v-model="name">
			<a-button slot="addonAfter" @click="showModal">
				20 điểm
			</a-button>
		</a-input-search>
		<a-modal title="Title" :visible="visible" :confirm-loading="confirmLoading" @ok="handleOk" @cancel="handleCancel">
			<p>{{ ModalText }}</p>
		</a-modal>
	</div>
</template>

<script>
	import { createNamespacedHelpers } from 'vuex';
	const { mapMutations, mapState, mapActions } = createNamespacedHelpers('order');

	export default {
		data: () => ({
			visible: false,
			ModalText: 'Content of the modal',
			confirmLoading: false,
			phoneNumber: 0,
		}),
		methods: {
			...mapMutations(['updateCustomerInfo']),
			...mapActions(['search_customer']),
			onSearch(e) {
				const value = e.target.value;
				if (value.length === 10) {
					this.search_customer(value);
				}
			},
			onSearch1: (e) => {},
			onChange(e, name) {
				let value = null;
				if (name == 'gender') value = e.target.checked;
				this.updateCustomerInfo({ key: name, value });
			},
			showModal() {
				this.visible = true;
			},
			handleOk(e) {
				this.ModalText = 'The modal will be closed after two seconds';
				this.confirmLoading = true;
				setTimeout(() => {
					this.visible = false;
					this.confirmLoading = false;
				}, 2000);
			},
			handleCancel(e) {
				console.log('Clicked cancel button');
				this.visible = false;
			},
		},
		computed: {
			...mapState(['customer']),
			gender: {
				get() {
					return this.customer.gender;
				},
				set(value) {
					this.updateCustomerInfo({ key: 'gender', value });
				},
			},
			name: {
				get() {
					return this.customer.name;
				},
				set(value) {
					this.updateCustomerInfo({ key: 'name', value });
				},
			},
		},
	};
</script>

<style></style>
