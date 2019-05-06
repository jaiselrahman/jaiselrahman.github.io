<template>
  <div class="card">
    <img class="img" src="../assets/logo.png">
    <h3>{{ name }}</h3>
    <div class="text">{{ description }}</div>
  </div>
</template>

<script>
export default {
  name: "ProjectCard",
  props: {
    name: String,
    description: String,
    tech: String
  }
};
</script>

<style scoped>
.card {
  display: block;
  width: 15rem;
  padding: 1rem 0;
  box-shadow: 0 0 20px 3px #ccc;
  margin: 1rem 1rem;
  text-align: center;
}

.card:hover {
  box-shadow: 0 0 10px 2px #ccc;
}

.card:active {
  box-shadow: 0 0 2px 1px #ccc;
  transform: scale(0.99);
}

h3 {
  margin: 0.5rem 0 0.5rem 0;
}

.img {
  width: 80%;
}
</style>
