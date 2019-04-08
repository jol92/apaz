<template lang="pug">
    .login
      h3 Perretes
      input.input(type="text" v-model="email" placeholder="Email Address" required)
      br
      input.input(type="password" v-model="password" placeholder="Password" required)
      br
      button.button(v-on:click="login") Enter
      p
        router-link(to="/signup") New Here? Create a new Account
</template>

<script>
import firebase from "firebase";

export default {
  name: "login",
  data: function() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    login() {
      firebase
        .auth()
        .signInWithEmailAndPassword(this.email, this.password)
        .then(user => {
          this.$router.replace("/comics");
        })
        .catch(err => {
          alert(err.message);
        });
    }
  }
};
</script>

<style scoped>
.login {
  margin-top: 40px;
}
input {
  align-self: center;
  margin: 10px 0;
  width: auto;
  padding: 15px;
}
button {
  margin: 10px 0;
  background-color: #0476f2;
}
a {
  color: black;
  text-decoration: underline;
}
p {
  margin-top: 40px;
  font-size: 13px;
}
h1,
h2 {
  font-weight: normal;
}
</style>
