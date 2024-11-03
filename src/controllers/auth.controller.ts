import { NextFunction, Request, Response } from "express";
import { users } from "../types";
import { userSchema } from "../schemas";
import { ErrorCode } from "../exceptions/root";
import { BadRequestException } from "../exceptions/bad-request";
import { Prismaclient } from "../index";

export const login = async (req: Request, res: Response, _next: NextFunction) => {
  try {
    userSchema.parse(req.body);
    const { correo, contrasena }: users = req.body;
    
    
    let user = await Prismaclient.uSUARIO.findFirst({
      where: {
        correo: correo,
      },
    });
    if (!user) {
      throw new BadRequestException(
        "user not found",
        ErrorCode.USER_NOT_FOUND
      );
    }

    if (user.contrasena === contrasena)
    {
      res.status(200).send('Match')
    }
    else 
      res.status(201).send('No match')

  } catch (err) {
    res.status(400).send(err);
  }
};

export const createUser = async (req: Request, res: Response) => {
  const { correo, contrasena }: users = req.body;

  try {
    let user = await Prismaclient.uSUARIO.findFirst({
      where: {
        correo: correo,
      },
    });

    console.log(user);
    if (!user) {
      console.log("in");

      // const data = await Prismaclient.uSUARIO.create({
      //   data: {
      //     correo,
      //     contrasena,
      //     rol: 'USUARIO',
      //   },
      // });
      // console.log(data);
      // res.json(data);
    } else {
      throw new BadRequestException(
        "User already exists",
        ErrorCode.USER_ALREADY_EXIST
      );
    }
  } catch (err) {
    res.status(500).json({ error: "Internal Server Error", details: err });
  }
};

export const getUsers = async (_req: Request, res: Response) => {
  const data = await Prismaclient.uSUARIO.findMany();

  res.json(data);
};
