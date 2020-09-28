<template>
  <div :style="{ padding: '20px' }">
    <a-input-search placeholder="Số diện thoại" size="large" @change="onSearch" v-model="phoneNumber" :maxLength="10">
      <a-button slot="enterButton">
        <a-checkbox @change="onChange">
          Nam
        </a-checkbox>
      </a-button>
    </a-input-search>

    <a-input-search placeholder="Tên khách hàng" size="large" @search="onSearch1">
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
  import { searchPartner } from '../../../Api/Order';
  export default {
    data: () => ({
      visible: false,
      ModalText: 'Content of the modal',
      confirmLoading: false,
      phoneNumber: 0,
    }),
    methods: {
      onSearch: (e) => {
        const value = e.target.value;
        if (value.length === 10) {
          searchPartner(value).then((rsp) => console.log(rsp));
        }
      },
      onSearch1: (e) => {},
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
