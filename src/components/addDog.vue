<template lang="pug">
div
  button.button-logout(v-on:click="logout") Logout
  article.covers(v-for="(dog, index) in dogs" :key="index")
    div
      img(style="margin: 10px" :src="dog.image" height="291px" width="192px")
      p {{dog.name}}
      hr
      button.button(@click="deletedog(dog.id)") Delete
  form(@submit="adddog(name, image)")
    h2 Add a
    input.input(v-model="name" placeholder="dog Name" required)
    input.input(v-model="image" placeholder="dog Image URL" required)
    button.button(type="submit") Add New Dog
</template>

<script>
import firebase from "firebase";
import { db } from "../main";

export default {
  name: "dogs",

  data() {
    return {
      dogs: [],
      name: "",
      image: ""
    };
  },

  firestore() {
    return {
      dogs: db.collection("dogs").orderBy("createdAt")
    };
  },

  methods: {
    adddog(name, image) {
      const createdAt = new Date();
      db.collection("dogs").add({ name, image, createdAt });
      // Clear values
      this.name = "";
      this.image = "";
    },

    deletedog(id) {
      db.collection("dogs")
        .doc(id)
        .delete();
    },
    logout() {
      firebase
        .auth()
        .signOut()
        .then(() => {
          this.$router.replace("login");
        });
    }
  }
};
</script>

<style scoped>
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: black;
}
input,
button {
  margin-bottom: 10px;
}
button {
  background-color: #0476f2;
}
.logout {
  left: 50%;
  top: 100%;
}
</style>
