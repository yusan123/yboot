<template>
  <Card :padding="0">
    <div class="info-card-con">
      <i-col class="info-card-icon-con" :style="{backgroundColor: color, color: 'white'}" span="8">
        <Row class="height-100" type="flex" align="middle" justify="center">
          <Icon :type="iconType" :size="iconSize"></Icon>
        </Row>
      </i-col>
      <i-col span="16" class="height-100">
        <Row type="flex" align="middle" justify="center" class="height-100">
          <count-up
            class="info-card-count user-created-count"
            :id-name="idName"
            :end-val="endVal"
            :color="color"
            :countSize="countSize"
            :countWeight="countWeight"
          >
            <p class="info-intro-text" slot="intro">{{ introText }}</p>
          </count-up>
        </Row>
      </i-col>
    </div>
  </Card>
</template>

<script>
import countUp from "./countUp.vue";

export default {
  name: "inforCard",
  components: {
    countUp
  },
  props: {
    idName: String,
    endVal: Number,
    color: String,
    iconType: String,
    introText: String,
    countSize: {
      type: String,
      default: "30px"
    },
    countWeight: {
      type: Number,
      default: 700
    },
    iconSize: {
      type: Number,
      default: 40
    }
  }
};
</script>
<style lang="less">
.info-card-icon-con {
  height: 100%;
}

.height-100 {
  height: 100%;
}

.info-card-con {
  height: 100px;
}

.info-intro-text {
  font-size: 12px;
  font-weight: 500;
  color: #c8c8c8;
}
</style>


