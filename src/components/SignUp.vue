<template lang="pug">
  .sign-up
    h3 Create New Account
    input.input(type="text" v-model="email" placeholder="Email Address" required)
    br
    input.input(v-model="password" type="password" placeholder="password" required)
    br
    button.button(v-on:click="signUp") Sign Up
    button.button
      router-link(to="/login") Back
</template>

<script>
import firebase from "firebase";
export default {
  name: "signup",
  data() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    signUp() {
      firebase
        .auth()
        .createUserWithEmailAndPassword(this.email, this.password)
        .then(user => {
          this.$router.replace("/login");
        })
        .catch(err => {
          alert(err.message);
        });
    }
  }
};
</script>

<style scoped>
.sign-up {
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
  color: #2c3e50;
}
p {
  margin-top: 40px;
  font-size: 13px;
}
h3 {
  font-weight: normal;
}
</style>
