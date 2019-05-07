<template>
  <div id="app">
    <div id="projects-type">
      <elastic-tab :menu="['All', 'Android','Web']" />
    </div>
    <div id="projects">
      <div v-for="project in projects" :key="project.name">
        <project-card v-bind="project" />
      </div>
    </div>
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
</style>
