import express from "express";
import authRouter from "./auth/auth.route";
import getRoutes from "./GET/get.routes";
import postRoutes from "./POST/post.routes";

const appRouter = express.Router();

appRouter.use("/auth", authRouter);
appRouter.use('/GET', getRoutes);
appRouter.use('/POST', postRoutes);

export default appRouter;
