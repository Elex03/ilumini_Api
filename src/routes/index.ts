import express from "express";
import authRouter from "./auth/auth.route";
import getRoutes from "./GET/get.routes";

const appRouter = express.Router();

appRouter.use("/auth", authRouter);
appRouter.use('/GET', getRoutes);

export default appRouter;
