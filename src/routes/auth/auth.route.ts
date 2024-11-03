import express from "express";
import { createUser, login } from "../../controllers/auth.controller";

const authRouter = express.Router();

authRouter.post("/login", login);
authRouter.post('/register', createUser);



export default authRouter;