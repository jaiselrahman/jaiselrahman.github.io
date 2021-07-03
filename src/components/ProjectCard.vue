<template>
  <div class="card">
    <img class="img" :src="img" :alt="name" />

    <h3 class="title">{{ name }}</h3>

    <div class="detail">
      <div class="description">{{ description }}</div>
      <div class="techs">
        <div v-for="tech in techs" :key="tech" class="tech">{{ tech }}</div>
      </div>
      <div class="links">
        <a v-for="link in links" :key="link.url" :href="link.url" target="_blank">
          <img class="icon" :src="getIcon(link.icon)" alt="" />
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import {getIcon} from '@/util'

export default {
  name: 'ProjectCard',
  props: {
    name: {type: String, required: true},
    description: {type: String, required: true},
    img: {type: String, required: true},
    techs: {type: Array, required: true},
    links: {type: Object, required: true},
  },
  methods: {
    getIcon,
  },
}
</script>

<style scoped>
.card {
  display: block;
  position: relative;
  width: 15rem;
  height: 20rem;
  background: white;
  box-shadow: 0 0 20px 3px #ccc;
  border-radius: 0.5rem;
  margin: 1rem 1rem;
  text-align: center;
  overflow: hidden;
}

.card > .detail {
  display: flex;
  flex-direction: column;
  position: absolute;
  top: 100%;
  height: 100%;
  width: 15rem;
  color: white;
  background: #000000dd;
}

.card:hover > .detail {
  top: 0;
  visibility: visible;
  transition: all 200ms;
}

.title {
  margin: 0 0.5rem 0 0.5rem;
  font-weight: 500;
}

.img {
  width: 100%;
  height: 88%;
}

.description {
  flex: 1;
  padding: 1rem;
  display: block;
  text-align: center;
}

.techs {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  margin-bottom: 1rem;
}

.techs > .tech {
  display: inline-block;
  color: white;
  background: linear-gradient(45deg, #05abe0 -10%, #8200f4 100%);
  padding: 0rem 0.5rem 0.1rem 0.5rem;
  border-radius: 5rem;
  margin: 0.2rem;
  font-size: 0.9rem;
}

.links {
  display: flex;
  justify-content: space-evenly;
}

.links > a > .icon {
  flex: 1;
  height: 2.5rem;
  width: 2.5rem;
  margin: 0.5rem;
  background: white;
  border-radius: 50%;
}

.links > a > .icon:hover {
  transform: scale(0.98);
}

.links > a > .icon:active {
  transform: scale(0.95);
}
</style>
