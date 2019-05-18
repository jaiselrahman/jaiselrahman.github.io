<template>
  <div id="app">
    <navigator />
    <a
      class="github-fork-ribbon"
      :href="profileData.projectUrl"
      data-ribbon="Fork me on GitHub"
      title="Fork me on GitHub"
      target="_bank"
    >Fork me on GitHub</a>
    <profile-page id="home" :profile="profileData" />
    <div id="projects">
      <elastic-tab :menu="['All', 'Android','Web']" @item-selected="onSelectedType" />
    </div>
    <transition-group tag="div" class="projects" name="projects">
      <project-card v-for="project in projects" :key="project.name" v-bind="project" />
    </transition-group>
    <contact-form id="contact" :spreadsheet-url="profileData.spreadsheetUrl" />
  </div>
</template>

<script>
import ProfilePage from "./components/ProfilePage.vue";
import ElasticTab from "./components/ElasticTab.vue";
import ProjectCard from "./components/ProjectCard.vue";
import Navigator from "./components/Navigator.vue";
import ContactForm from "./components/ContactForm.vue";

import "github-fork-ribbon-css/gh-fork-ribbon.css";

import projectData from "./project.json";
import profileData from "./profile.json";

export default {
  name: "App",
  components: {
    ProjectCard,
    ElasticTab,
    ProfilePage,
    ContactForm,
    Navigator
  },
  data() {
    return { projects: projectData, profileData: profileData };
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

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
}

#app {
  font-family: "Itim";
}

.projects {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
}

#projects {
  text-align: center;
  padding: 1rem;
}

@media only screen and (max-width: 700px) {
  #projects {
    padding: 3rem 1rem 1rem 1rem;
  }
}

.projects-move {
  transition: all 500ms;
}
.projects-enter-active {
  transition: all 200ms ease-out;
}

.projects-leave-active {
  position: absolute;
  transition: all 200ms ease-in;
  transform: scale(0.5);
}

.projects-enter,
.projects-leave-to {
  opacity: 0;
}

.github-fork-ribbon:before {
  background: black;
}
</style>
