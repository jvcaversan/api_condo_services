import express from "express";
import { router } from "./routes/userRoutes";

const app = express();

app.use(express.json());

const port = 3050;

app.use(router);

app.listen(port, () => {
  console.log(`Api startada na porta: ${port}`);
});
