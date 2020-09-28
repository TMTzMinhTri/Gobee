<template>
  <a-layout-content :style="{ padding: '24px', background: '#fff' }">
    <a-list :data-source="data">
      <a-list-item slot="renderItem" slot-scope="item">
        <a-list-item-meta :description="item.price">
          <a slot="title" :href="item.href">{{ item.name }}</a>
          <a-avatar slot="avatar" src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png" />
        </a-list-item-meta>
        <div>
          <increase-button />
        </div>
      </a-list-item>
    </a-list>
  </a-layout-content>
</template>

<script>
  import IncreaseButton from '../../../Components/IncreaseButton/index';
  import { getListProduct } from '../../../Api/Order';
  export default {
    components: { IncreaseButton },
    data: () => ({
      data: [],
    }),
    mounted() {
      getListProduct().then((rsp) => (this.data = rsp.map((it) => it.attributes)));
    },
  };
</script>

<style></style>
