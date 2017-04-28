import Vue from "vue";
import Storage from "helper-storage";

Vue.use(Storage, {
    driver: "localStorage"
});