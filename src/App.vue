<template>
  <div id="app">
    <div id="projects-type">
      <elastic-tab :menu="['All', 'Android','Web']" @item-selected="onSelectedType" />
    </div>
    <transition-group tag="div" id="projects" name="projects" mode="in-out">
      <div v-for="project in projects" :key="project.name">
        <project-card v-bind="project" />
      </div>
    </transition-group>
  </div>
</template>

<script>
import ElasticTab from "./components/ElasticTab.vue";
import ProjectCard from "./components/ProjectCard.vue";
import projectData from "./project.json";

export default {
  name: "App",
  components: {
    ProjectCard,
    ElasticTab
  },
  data() {
    return { projects: [] };
  },
  created() {
    this.projects = projectData;
  },
  methods: {
    onSelectedType(type) {
      if (type == "All") {
        this.projects = projectData;
      } else {
        this.projects = projectData.filter(i => i.type === type);
      }
    }
  }
};
</script>

<style>
@import url("https://fonts.googleapis.com/css?family=Itim");

#app {
  font-family: "Itim";
}

#projects {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
}

#projects-type {
  text-align: center;
  padding: 1rem;
}

.projects-move {
  transition: all 500ms;
}

.projects-enter,
.projects-leave-to {
  opacity: 0;
}

.projects-leave,
.projects-enter-to {
  opacity: 1;
}

.projects-leave-active {
  transition: 500ms;
  position: absolute;
  margin-top: 50%;
}
</style>
