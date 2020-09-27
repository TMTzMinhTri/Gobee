<template>
  <div id="app">
    <order-screen></order-screen>
  </div>
</template>

<script>
  import OrderScreen from './Screens/Order/index';
  export default {
    components: { OrderScreen },
    data: function() {
      return {
        message: 'Hello Vue!',
      };
    },
  };
</script>

<style>
  /* @media only screen and (min-width: 600px) {
    html {
      display: none;
    }
  } */
</style>
