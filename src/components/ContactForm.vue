<template>
  <div class="contact-form">
    <h1 class="title">Contact Me</h1>
    <div class="form">
      <form name="contact" action method="post">
        <label class="form-label" for="name">Name</label>
        <input class="form-field" type="text" name="name" id="name">
        <label class="form-label" for="email">Email</label>
        <input class="form-field" type="text" name="email" id="email" required>
        <label class="form-label" for="message">Message</label>
        <textarea class="form-field" type="text" name="message" id="message" rows="5" />
        <input class="form-button" type="submit" value="Send message" @click="submit()">
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "ContactForm",
  methods: {
    submit() {
      alert("Submitted");
    }
  }
};
</script>

<style scoped>
.contact-form {
  display: block;
  min-height: 80vh;
  padding: 10vh 0;
  background: linear-gradient(
    to bottom right,
    #6f27ad,
    #3963bd 30% 70%,
    #6f27ad
  );
  color: white;
}

.title {
  text-align: center;
}

.form {
  display: block;
  margin: auto;
  width: 40%;
  text-align: right;
}

@media only screen and (max-width: 900px) {
  .form {
    width: 60%;
  }
}

@media only screen and (max-width: 700px) {
  .form {
    width: 80%;
  }
}

.form-label {
  display: block;
  font-size: 14pt;
  text-align: left;
}

.form-field {
  display: block;
  width: 100%;
  padding: 1rem 1.5rem;
  margin: 0.2rem 0 1rem 0;
  border: 2px #6f27ad solid;
  border-radius: 0.3rem;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.25);
  box-sizing: border-box;
  font-family: "Itim";
  font-size: 14pt;
}

.form-field:focus {
  outline: none;
  border: 2px #0193d6 solid;
  box-shadow: 0 0 10px #0193d6;
}

.form-button {
  font-family: "Itim";
  padding: 0.5rem;
  background: #6f27ad;
  color: white;
  font-size: 14pt;
  margin-top: 0.5rem;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.25);
  border-radius: 0.3rem;
  border: none;
  outline: none;
}

.form-button:focus {
  border: 1px #0193d6 solid;
  box-shadow: 0 0 5px #0193d6;
}

.form-button:hover {
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

.form-button:active {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
  transform: scale(0.95);
}
</style>
