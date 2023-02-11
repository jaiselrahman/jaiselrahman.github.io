<template>
  <nav class="tabs">
    <div ref="selectorRef" class="selector" />
    <span
      v-for="(item, key) in menu"
      :ref="(el) => (menuRefs[key] = el)"
      :key="item"
      :class="{active: activeMenu === item}"
      @click="(event) => click(event.target, item)"
    >
      {{ item }}
    </span>
  </nav>
</template>

<script>
import {onMounted, onBeforeUpdate, ref} from 'vue'

export default {
  name: 'ElasticTab',
  props: {
    menu: {type: Array, default: () => []},
  },
  emits: ['item-selected'],
  setup(props, {emit}) {
    const activeMenu = ref(props.menu[0])
    const selectorRef = ref(null)
    const menuRefs = ref([])

    onBeforeUpdate(() => (menuRefs.value = []))

    onMounted(() => setTimeout(() => click(menuRefs.value[0], props.menu[0]), 150))

    const click = (target, menu) => {
      if (!target) return
      selectorRef.value.style.left = target.offsetLeft + 'px'
      selectorRef.value.style.width = target.offsetWidth + 'px'
      if (activeMenu.value !== menu) {
        activeMenu.value = menu
        emit('item-selected', menu)
      }
    }

    return {
      selectorRef,
      menuRefs,
      activeMenu,
      click,
    }
  },
}
</script>

<style scoped>
.tabs {
  /* background: #fff; */
  box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.1);
  border-radius: 50px;
  position: relative;
  user-select: none;
  display: inline-block;
  text-align: center;
}

.tabs span {
  text-decoration: none;
  color: #555;
  text-transform: uppercase;
  padding: 10px 20px;
  display: inline-block;
  position: relative;
  z-index: 1;
}

.tabs span.active {
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
  transition-duration: 0.3s;
  transition-timing-function: cubic-bezier(0.68, -0.55, 0.265, 1.55);
  background: #05abe0;
  background: linear-gradient(45deg, #05abe0 0%, #8200f4 100%);
}
</style>
