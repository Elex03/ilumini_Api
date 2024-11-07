import axios from "axios";

const iluminiApi = axios.create({
  baseURL: "http://localhost:3000/Api/auth/login",
});

export const res = () => {
  iluminiApi
    .post("/", {
      correo:'eacuna042@gmail.com', 
      contrasena: '1234'
    })
    .then((res) => {
      console.log(res.data);
    })
    .catch((err) => {
      console.log(err);
    });
};
