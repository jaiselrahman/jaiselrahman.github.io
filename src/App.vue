<template>
  <div id="app">
    <div id="projects">
      <div v-for="project in  projects" :key="project.name">
        <project-card v-bind="project"/>
      </div>
    </div>
  </div>
</template>

<script>
import ProjectCard from "./components/ProjectCard.vue";
import projectData from "./project.json";

export default {
  name: "app",
  components: {
    ProjectCard
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
</style>
