import express from "express";
import { singup, login } from "../../controllers/auth.controller";

const authRouter = express.Router();

authRouter.post("/login", login);
authRouter.post('/singup', singup);

export default authRouter;