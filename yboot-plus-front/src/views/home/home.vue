<style lang="less">
@import "./home.less";
@import "../../styles/common.less";
</style>

<template>
  <div>
    <div v-show="currNav=='yboot'" class="home">
      <Row :gutter="10">
        <i-col :lg="24" :xl="24">
          <Row :gutter="5">
            <i-col :sm="24" :md="12" :lg="6" :style="{marginBottom: '10px'}">
              <info-card
                id-name="user_created_count"
                :end-val="count.createUser"
                iconType="md-person-add"
                color="#2d8cf0"
                intro-text="今日新增用户"
              ></info-card>
            </i-col>
            <i-col :sm="24" :md="12" :lg="6" :style="{marginBottom: '10px'}">
              <info-card
                id-name="visit_count"
                :end-val="count.visit"
                iconType="ios-eye"
                color="#64d572"
                :iconSize="50"
                intro-text="今日浏览量"
              ></info-card>
            </i-col>
            <i-col :sm="24" :md="12" :lg="6" :style="{marginBottom: '10px'}">
              <info-card
                id-name="collection_count"
                :end-val="count.collection"
                iconType="md-cloud-upload"
                color="#ffd572"
                intro-text="今日数据采集量"
              ></info-card>
            </i-col>
            <i-col :sm="24" :md="12" :lg="6" :style="{marginBottom: '10px'}">
              <info-card
                id-name="transfer_count"
                :end-val="count.transfer"
                iconType="md-shuffle"
                color="#f25e43"
                intro-text="今日服务调用量"
              ></info-card>
            </i-col>
          </Row>
        </i-col>
      </Row>
      <Row :gutter="10">
        <i-col :lg="24" :xl="16" :style="{marginBottom: '10px'}">
          <visit-volume/>
        </i-col>
        <i-col :lg="24" :xl="8" :style="{marginBottom: '10px'}">
          <visit-separation/>
        </i-col>
      </Row>
    </div>
  </div>
</template>

<script>
import { ipInfo } from "@/api/index";
import visitVolume from "./components/visitVolume.vue";
import visitSeparation from "./components/visitSeparation.vue";
import infoCard from "./components/infoCard.vue";
import Cookies from "js-cookie";
import "gitalk/dist/gitalk.css";
import Gitalk from "gitalk";

export default {
  name: "home",
  components: {
    visitVolume,
    visitSeparation,
    infoCard,
  },
  data() {
    return {
      showVideo: false,
      count: {
        createUser: 496,
        visit: 3264,
        collection: 24389305,
        transfer: 39503498
      },
      city: "",
      username: ""
    };
  },
  computed: {
    currNav() {
      return this.$store.state.app.currNav;
    },
    avatarPath() {
      return localStorage.avatorImgPath;
    }
  },
  methods: {
    init() {
      let userInfo = JSON.parse(Cookies.get("userInfo"));
      this.username = userInfo.username;
      ipInfo().then(res => {
        if (res.success) {
          this.city = res.result;
        }
      });
    }
  },
  mounted() {
    this.init();
    var gitalk = new Gitalk({
      clientID: "a128de2dd7383614273a",
      clientSecret: "a77691ecb662a8303a6c686ae651ae035868da6e",
      repo: "yboot-comments",
      owner: "canghaihongxin",
      admin: ["canghaihongxin"],
      distractionFreeMode: false // 遮罩效果
    });
    gitalk.render("comments");
    // 宣传视频
    let ybootVideo = Boolean(Cookies.get("ybootVideo"));
    if (!ybootVideo) {
      this.showVideo = true;
      Cookies.set("ybootVideo", true);
    }
  }
};
</script>
