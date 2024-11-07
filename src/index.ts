import express from "express";
import appRouter from "./routes";
import { errorMiddleware } from "./middleware/erros";
import { PrismaClient } from "@prisma/client";
import cors from "cors";

const app = express();

app.use(cors());
app.use(express.json());
app.use("/Api", appRouter);
app.use(errorMiddleware);

export const Prismaclient = new PrismaClient({
  log: ["query"],
});

app.listen(3000, () => {
  console.log("Api listen in port 3000");
});
