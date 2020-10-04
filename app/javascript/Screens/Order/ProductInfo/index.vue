<template>
	<a-layout-content :style="{ padding: '24px', background: '#fff' }">
		<a-list :data-source="data">
			<a-list-item slot="renderItem" slot-scope="item">
				<a-list-item-meta :description="item.price">
					<a slot="title" :href="item.href">{{ item.name }}</a>
					<a-avatar slot="avatar" src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png" />
				</a-list-item-meta>
				<div>
					<increase-button @changeQuantity="(value) => changeQuantityProduct({ ...item, quantity: value })" />
				</div>
			</a-list-item>
		</a-list>
	</a-layout-content>
</template>

<script>
	import { createNamespacedHelpers } from 'vuex';

	import IncreaseButton from '../../../Components/IncreaseButton/index';
	import { getListProduct } from '../../../Api/Order';

	const { mapMutations, mapState } = createNamespacedHelpers('order');

	export default {
		components: { IncreaseButton },
		data: () => ({
			data: [],
		}),
		mounted() {
			getListProduct().then((rsp) => (this.data = rsp.data));
		},
		methods: {
			...mapMutations(['updateQuantityProduct']),
			changeQuantityProduct(value) {
				this.updateQuantityProduct(value);
			},
		},
	};
</script>

<style></style>
