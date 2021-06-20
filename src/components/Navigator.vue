<template>
  <div class="menu" is="transition-group" name="menus">
    <li class="main-icon" key="main" @click="toggle()" ref="menu-bar">
      <div class="container">
        <div class="bar1" />
        <div class="bar2" />
        <div class="bar3" />
      </div>
    </li>
    <li class="menu-item item-one" key="one" v-show="show">
      <a class="icon" href="#home" @click="toggle()" title="Home">
        <img class="icon-one" :src="require('../assets/menu_home_48.png')">
      </a>
    </li>
    <li class="menu-item item-two" key="two" v-show="show">
      <a class="icon" href="#projects" @click="toggle()" title="Projects">
        <img class="icon-two" :src="require('../assets/menu_projects_48.png')">
      </a>
    </li>
    <li class="menu-item item-three" key="three" v-show="show">
      <a class="icon" href="#resume" @click="toggle()" title="Resume">
        <img class="icon-three" :src="require('../assets/menu_resume_48.png')">
      </a>
    </li>
    <li class="menu-item item-four" key="four" v-show="show">
      <a class="icon" href="#contact" @click="toggle()" title="Contact Me">
        <img class="icon-four" :src="require('../assets/menu_message_48.png')">
      </a>
    </li>
  </div>
</template>

<script>
export default {
  name: "Navigator",
  data() {
    return {
      show: false
    };
  },
  methods: {
    toggle() {
      this.show = !this.show;
      this.$refs["menu-bar"].classList.toggle("change");
    }
  }
};
</script>

<style scoped>
.menu {
  position: fixed;
  top: 0;
  left: 0;
  margin-left: 0.5rem;
  margin-top: 0.5rem;
  list-style: none;
  user-select: none;
  -webkit-tap-highlight-color: transparent;
  z-index: 2;
}

.menu-item {
  position: absolute;
  top: 0;
  left: -6.5rem;
  width: 8rem;
  z-index: -1;
  transform-origin: right;
}

@media only screen and (max-width: 700px) {
  .menu {
    margin-left: 0.2rem;
    margin-top: 0.2rem;
  }
}

.item-one {
  transform: rotate(180deg);
}

.item-two {
  transform: rotate(210deg);
}

.item-three {
  transform: rotate(240deg);
}

.item-four {
  transform: rotate(270deg);
}

.icon {
  display: block;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  border-radius: 50%;
  background: #6f27ad;
  width: 2.8rem;
  height: 2.8rem;
}

.icon > img {
  width: inherit;
  height: inherit;
}

.icon:active {
  transform: scale(0.95);
}

.icon-one {
  transform: rotate(-180deg);
}

.icon-two {
  transform: rotate(-210deg);
}

.icon-three {
  transform: rotate(-240deg);
}

.icon-four {
  transform: rotate(-270deg);
}

.main-icon {
  background: #6f27ad;
  display: block;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  border-radius: 50%;
  width: 3.5rem;
  height: 3.5rem;
  cursor: pointer;
}

.main-icon:active {
  transform: scale(0.9);
}

.main-icon:hover {
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.4);
}

.main-icon:active {
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
  transform: scale(0.95);
}

.menus-enter-active {
  transition: all 300ms ease-out;
}

.menus-leave-active {
  transition: all 300ms ease-in;
}

.menus-enter {
  transform: rotate(150deg);
}

.menus-leave-to {
  transform: rotate(300deg);
}

.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.bar1,
.bar2,
.bar3 {
  width: 2rem;
  height: 3px;
  background-color: white;
  margin: 5px 0;
  transition: 300ms;
}

.change .bar1 {
  transform: rotate(-45deg) translate(-5.5px, 6px);
}

.change .bar2 {
  opacity: 0;
}

.change .bar3 {
  transform: rotate(45deg) translate(-5.5px, -6px);
}
</style>