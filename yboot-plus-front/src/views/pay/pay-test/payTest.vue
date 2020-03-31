<template>
  <div>
      <h1>支付一毛钱，测试使用无法退回</h1>
    <div id="qrCode" ref="qrCodeDiv"></div>
  </div>
</template>

<script>
 import QRCode from 'qrcodejs2';
 import {getPayOrder} from "@/api/index";
export default {
    name: "qrCode",
    data() {
        return {}
    },
    mounted: function () {
      this.$nextTick(function () {
          this.bindQRCode();
      })
      
    },
     methods: {
      bindQRCode: function () {
          getPayOrder({"payType":"WXPAY_NATIVE"}).then(res => {
            if (res.success) {
                new QRCode(this.$refs.qrCodeDiv, {
                    text: res.result.codeUrl,
                    width: 200,
                    height: 200,
                    colorDark: "#333333", //二维码颜色
                    colorLight: "#ffffff", //二维码背景色
                    correctLevel: QRCode.CorrectLevel.L//容错率，L/M/H
                })
            }
        });
       
      }
    }
}
</script>

<style>

</style>