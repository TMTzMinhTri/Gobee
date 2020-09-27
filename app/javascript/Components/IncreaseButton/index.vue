<template>
  <div>
    <button @click="changeValue('increase')">+</button>
    <input type="number" :style="{ width: '50px', textAlign: 'center' }" v-model="currentQuantity" />
    <button :disabled="currentQuantity == 0" @click="changeValue('decrease')">-</button>
  </div>
</template>

<script>
  export default {
    data: () => ({
      currentQuantity: 0,
    }),
    methods: {
      changeValue: function(type) {
        switch (type) {
          case 'increase':
            this.currentQuantity++;
            break;
          case 'decrease':
            this.currentQuantity--;
            break;
        }
        console.log(this.currentQuantity);
      },
    },
  };
</script>

<style></style>
