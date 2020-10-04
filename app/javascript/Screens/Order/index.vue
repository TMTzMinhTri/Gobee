<template>
	<div>
		<user-info />
		<product-info />
		<payment />
	</div>
</template>

<script>
	import { createNamespacedHelpers } from 'vuex';
	import UserInfo from './UserInfo/index';
	import ProductInfo from './ProductInfo/index';
	import Payment from './Payment/index';
	const { mapMutations, mapState } = createNamespacedHelpers('order');

	export default {
		components: { UserInfo, ProductInfo, Payment },
		created() {
			// console.log(this);
		},
		computed: {
			...mapState(['customer']),
		},
	};
</script>

<style></style>
