<template>
  <div id="app">
    <profile-page />
    <div id="projects-type">
      <elastic-tab :menu="['All', 'Android','Web']" @item-selected="onSelectedType" />
    </div>
    <transition-group tag="div" id="projects" name="projects">
      <project-card v-for="project in projects" :key="project.name" v-bind="project" />
    </transition-group>
  </div>
</template>

<script>
import ProfilePage from "./components/ProfilePage";
import ElasticTab from "./components/ElasticTab.vue";
import ProjectCard from "./components/ProjectCard.vue";
import projectData from "./project.json";

export default {
  name: "App",
  components: {
    ProjectCard,
    ElasticTab,
    ProfilePage
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

body {
  margin: 0;
}

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
  transition: 300ms;
  position: absolute;
  top: 50%;
}
</style>
