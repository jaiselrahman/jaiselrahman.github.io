<template>
  <div class="profile-page">
    <div class="circular-img">
      <img class="profile" :src="getIcon(profile.profilePic)" >
    </div>
    <div class="name">{{ profile.name }}</div>
    <div class="bio">{{ profile.bio }}</div>
    <div class="contacts">
      <a v-for="contact in profile.contacts" :key="contact.name" :href="contact.link">
        <img
          class="circular-img logo"
          :alt="contact.name"
          :src="getIcon(contact.icon)"
          :title="contact.name"
        >
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: "ProfilePage",
  props: {
    profile: Object
  },
  methods: {
    getIcon(icon) {
      try {
        return require("../assets/" + icon);
      } catch {
        return null;
      }
    }
  }
};
</script>

<style scoped>
.profile-page {
  min-height: 80vh;
  padding: 10vh 0;
  background: #3963bd;
  background: -moz-linear-gradient(
    to bottom right,
    #6f27ad,
    #3963bd 30% 70%,
    #6f27ad
  );
  background: -webkit-linear-gradient(
    to bottom right,
    #6f27ad,
    #3963bd 30% 70%,
    #6f27ad
  );
  background: linear-gradient(
    to bottom right,
    #6f27ad,
    #3963bd 30% 70%,
    #6f27ad
  );
  color: white;
  text-align: center;
}

.name {
  margin-top: 1rem;
  font-size: 2rem;
  text-shadow: 5rem black;
}

.bio {
  margin: 1rem 10%;
  color: white;
  font-size: 1.2rem;
  text-align: justify;
}

@media only screen and (max-width: 700px) {
  .profile-page {
    min-height: 70vh;
    padding: 18vh 0 12vh 0;
  }
}

@media only screen and (min-width: 700px) {
  .bio {
    margin: 1rem 20%;
  }
}

@media only screen and (min-width: 900px) {
  .bio {
    margin: 1rem 30%;
  }
}

.profile {
  position: relative;
  width: 100%;
  bottom: 1.75rem;
  align-content: center;
  clip-path: ellipse(68% 85% at 50% 10%);
}

.circular-img {
  width: 10rem;
  height: 10rem;
  border-radius: 50%;
  background: white;
  margin: auto;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.25);
}

.contacts {
  display: flex;
  margin-top: 2rem;
  justify-content: center;
}

.logo {
  height: 3rem;
  width: 3rem;
  margin: 0.5rem;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.25);
}

.logo:hover {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.logo:active {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
  transform: scale(0.95);
}
</style>
