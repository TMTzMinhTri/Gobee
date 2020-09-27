<template>
  <div :style="{ padding: '20px' }">
    <a-input-search placeholder="Số diện thoại" size="large" @search="onSearch">
      <a-button slot="enterButton">
        <a-checkbox @change="onChange">
          Nam
        </a-checkbox>
      </a-button>
    </a-input-search>

    <a-input-search placeholder="Tên khách hàng" size="large" @search="onSearch">
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
  export default {
    data: () => ({
      visible: false,
      ModalText: 'Content of the modal',
      confirmLoading: false,
    }),
    methods: {
      onSearch: () => {},
      onChange: () => {},
      showModal() {
        console.log('aa');
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
  };
</script>

<style></style>
