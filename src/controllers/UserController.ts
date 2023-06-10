import { Request, Response } from "express";
import { prisma } from "../database/prisma";
import { hash } from "bcryptjs";

export const createUser = async (req: Request, res: Response) => {
  const { name, email, password } = req.body;

  const uniqueEmail = await prisma.user.findUnique({
    where: {
      email,
    },
  });

  if (uniqueEmail) {
    res.status(400).json({ message: "Esse email já está cadastrado!" });
  }

  const hashPassword = await hash(password, 8);

  const user = await prisma.user.create({
    data: { name, email, password: hashPassword },
  });

  return res.status(200).json(user);
};

export const getAllUser = async (req: Request, res: Response) => {
  const user = await prisma.user.findMany();

  return res.json(user);
};

// export const updateUserById = async (req: Request, res: Response) => {
//   const { id } = req.params;
//   const { name, email, password } = req.body;

//   const user = await prisma.user.update({
//     where: {
//       name,
//       email,
//       password,
//     },
//   });
// };

export const deleteAllUser = async (req: Request, res: Response) => {
  await prisma.user.deleteMany();

  return res.json({ message: "Todos usuários deletados" });
};
