<template>
  <nav class="tabs">
    <div ref="selector" class="selector" />
    <a
      v-for="(item, key) in menu"
      ref="menu"
      :key="key"
      :class="{ active: activeId === key }"
      @click="activeId = key; click();"
    >{{ item }}</a>
  </nav>
</template>

<script>
export default {
  name: "ElasticTab",
  props: {
    menu: Array
  },
  data() {
    return {
      activeId: 0
    };
  },
  mounted() {
    let selector = this.$refs.selector;
    let target = this.$refs.menu[0];
    selector.style.left = target.offisetLeft + "px";
    selector.style.width = target.offsetWidth + "px";
  },
  methods: {
    click() {
      let target = event.target;
      let selector = this.$refs.selector;
      selector.style.left = target.offsetLeft + "px";
      selector.style.width = target.offsetWidth + "px";
    }
  }
};
</script>

<style scoped>
.tabs {
  background: #fff;
  box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.1);
  border-radius: 50px;
  position: relative;
  user-select: none;
  display: inline-block;
  text-align: center;
}

.tabs a {
  text-decoration: none;
  color: #777;
  text-transform: uppercase;
  padding: 10px 20px;
  display: inline-block;
  position: relative;
  z-index: 1;
  transition-duration: 0.5s;
}

.tabs a.active {
  color: white;
}

.tabs .selector {
  height: 100%;
  display: inline-block;
  position: absolute;
  left: 0px;
  top: 0px;
  z-index: 1;
  border-radius: 50px;
  transition-duration: 0.5s;
  transition-timing-function: cubic-bezier(0.68, -0.55, 0.265, 1.55);
  background: #05abe0;
  background: -moz-linear-gradient(45deg, #05abe0 0%, #8200f4 100%);
  background: -webkit-linear-gradient(45deg, #05abe0 0%, #8200f4 100%);
  background: linear-gradient(45deg, #05abe0 0%, #8200f4 100%);
}
</style>
