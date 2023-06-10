import {
  createUser,
  deleteAllUser,
  getAllUser,
} from "../controllers/UserController";
import { Router } from "express";

export const router = Router();

router.post("/users", createUser);
router.get("/users", getAllUser);
router.delete("/users", deleteAllUser);
