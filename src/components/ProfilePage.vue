<template>
  <div class="profile-page">
    <img class="circular-img profile" :src="require('../assets/logo.png')">
    <div class="name">Jaisel Rahman</div>
    <div class="bio">Interested in Android and Web development. Loves Opensource.</div>
    <div class="contacts">
      <img class="circular-img logo" :src="require('../assets/github_56.png')">
      <img class="circular-img logo" :src="require('../assets/linkedin_56.png')">
      <img class="circular-img logo" :src="require('../assets/twitter_56.png')">
      <img class="circular-img logo" :src="require('../assets/stackoverflow_56.png')">
      <img class="circular-img logo" :src="require('../assets/blogger_56.png')">
    </div>
  </div>
</template>

<script>
export default {
  name: "ProfilePage"
};
</script>

<style scoped>
.profile-page {
  height: 90vh;
  padding-top: 10vh;
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
  margin-top: 1rem;
  color: white;
  font-size: 1.2rem;
  text-align: center;
}

.profile {
  display: block;
  margin: auto;
  width: 10rem;
  background: white;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.25);
}

.circular-img {
  border-radius: 50%;
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
