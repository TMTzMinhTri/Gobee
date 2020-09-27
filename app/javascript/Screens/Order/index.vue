<template>
  <div>
    <user-info />
    <product-info />
    <payment />
  </div>
</template>

<script>
  import UserInfo from './UserInfo/index';
  import ProductInfo from './ProductInfo/index';
  import Payment from './Payment/index';

  export default {
    components: { UserInfo, ProductInfo, Payment },
  };
</script>

<style></style>
