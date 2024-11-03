import express from "express";
import appRouter from "./routes";
import { errorMiddleware } from "./middleware/erros";
import { PrismaClient } from '@prisma/client';

const app = express();

app.use(express.json())
app.use(appRouter);
app.use(errorMiddleware);


export const Prismaclient = new PrismaClient ({
  log: ['query']
})

app.listen(3000, () => {
  console.log("Api listen in port 3000");
});
