<template>
  <nav class="tabs">
    <div ref="selectorRef" class="selector" />
    <a
      v-for="(item, key) in menu"
      :ref="(el) => (menuRefs[key] = el)"
      :key="key"
      :class="{ active: activeId === key }"
      @click="(event) => click(event, item, key)"
    >{{ item }}</a>
  </nav>
</template>

<script>
import { onMounted, onBeforeUpdate, ref } from "vue";

export default {
  name: "ElasticTab",
  emits: ["item-selected"],
  props: {
    menu: { type: Array, default: () => [] },
  },
  setup(props, { emit }) {
    const activeId = ref(0);
    const selectorRef = ref(null);
    const menuRefs = ref([]);

    onBeforeUpdate(() => (menuRefs.value = []));

    onMounted(() => {
      const target = menuRefs.value[0];
      selectorRef.value.style.left = target.offsetLeft + "px";
      selectorRef.value.style.width = target.offsetWidth + "px";
    });

    const click = (event, item, key) => {
      let target = event.target;
      selectorRef.value.style.left = target.offsetLeft + "px";
      selectorRef.value.style.width = target.offsetWidth + "px";
      activeId.value = key;
      emit('item-selected', item)
    };

    return {
      selectorRef,
      menuRefs,
      activeId,
      click,
    };
  },
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
