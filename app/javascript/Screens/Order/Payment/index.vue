<template>
  <a-row type="flex" align="middle">
    <a-col :span="20">
      <div class="payment">
        <div>Tạm tính: 250000 VND</div>
        <div>Tổng số lượng: 2 sản phẩm</div>
      </div>
    </a-col>
    <a-col :span="4">
      <div class="payment yellow">
        <a-icon type="right" :style="{ fontSize: '42px' }" />
      </div>
    </a-col>
  </a-row>
</template>

<script>
  export default {};
</script>

<style>
  .payment {
    position: fixed;
    bottom: 0;
    background: orange;
    color: #fff;
    padding: 15px;
    width: 100%;
  }
  .payment.yellow {
    background: #ffd700;
  }
</style>
