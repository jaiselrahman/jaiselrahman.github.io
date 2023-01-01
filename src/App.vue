<template>
  <div id="app">
    <navigator />
    <a
      class="github-fork-ribbon"
      :href="profileData.projectUrl"
      data-ribbon="Fork me on GitHub"
      title="Fork me on GitHub"
      target="_bank"
    >
      Fork me on GitHub
    </a>
    <profile-page id="home" :profile="profileData" />
    <div id="projects-header">
      <elastic-tab :menu="['All', 'Android', 'Web']" @item-selected="onSelectedType" />
    </div>
    <transition-group tag="div" class="projects" name="projects">
      <project-card v-for="project in projects" :key="project.name" v-bind="project" />
    </transition-group>
    <contact-form id="contact" :spreadsheet-url="profileData.spreadsheetUrl" />
  </div>
</template>

<script>
import ProfilePage from '@/components/ProfilePage.vue'
import ElasticTab from '@/components/ElasticTab.vue'
import ProjectCard from '@/components/ProjectCard.vue'
import Navigator from '@/components/Navigator.vue'
import ContactForm from '@/components/ContactForm.vue'

import 'github-fork-ribbon-css/gh-fork-ribbon.css'

import projectData from '@/project.json'
import profileData from '@/profile.json'

export default {
  name: 'App',
  components: {
    ProjectCard,
    ElasticTab,
    ProfilePage,
    ContactForm,
    Navigator,
  },
  data() {
    return {
      projects: projectData.projects,
      profileData: profileData,
    }
  },
  methods: {
    onSelectedType(type) {
      if (type == 'All') {
        this.projects = projectData
      } else {
        this.projects = projectData.filter((i) => i.type === type)
      }
    },
  },
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Itim&display=swap');

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
}

#app {
  font-family: 'Itim';
}

.projects {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
}

#projects-header {
  text-align: center;
  padding: 1rem;
}

@media only screen and (max-width: 700px) {
  #projects-header {
    padding: 3rem 1rem 1rem 1rem;
  }
}

.projects > .card {
  transition: all 0.3s ease-in-out;
}

.projects-enter-from {
  transform: scale(0.5) translateY(150px);
  opacity: 0;
}

.projects-leave-to {
  transform: translateY(150px);
  opacity: 0;
}

.projects-leave-active {
  position: absolute !important;
  z-index: -1;
}

.github-fork-ribbon:before {
  background: black;
}
</style>
