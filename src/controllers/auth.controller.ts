import { NextFunction, Request, Response } from "express";
import { Iuser } from "../types";
import { userSchema } from "../schemas/auth";
import { ErrorCode } from "../exceptions/root";
import { BadRequestException } from "../exceptions/bad-request";
import { Prismaclient } from "../index";
import * as jwt from "jsonwebtoken";
import {compareSync, hashSync} from 'bcrypt'

import {
  ACCESS_TOKEN_EXPIRATION,
  JWT_ROUND,
  JWT_SECRET,
  REFRESH_TOKEN_EXPIRATION,
} from "../config";

export const login = async (
  req: Request,
  res: Response,
  _next: NextFunction
) => {
  try {
    userSchema.parse(req.body);
    const { email, password }: Iuser = req.body;

    let user = await Prismaclient.uSUARIO.findFirst({
      where: {
        email,
      },
    });
    if (!user) {
      throw new BadRequestException("user not found", ErrorCode.USER_NOT_FOUND);
    }

    if (compareSync(password, user.password)) {
      const accesToken = jwt.sign(
        {
          password: user.user_pk,
        },
        JWT_SECRET,
        { expiresIn: ACCESS_TOKEN_EXPIRATION }
      );
      const refreshToken = jwt.sign(
        {
          password: password,
        },
        JWT_SECRET,
        { expiresIn: REFRESH_TOKEN_EXPIRATION }
      );
      res.json({
        Tokens: {
          accesToken: accesToken,
          refreshToken: refreshToken,
        },
      });
    } else res.status(201).send("No match");
  } catch (err) {
    res.status(400).send(err);
  }
};

export const singup = async (req: Request, res: Response) => {
  userSchema.parse(req.body);
  const { email, password }: Iuser = req.body;
  try {
    let user = await Prismaclient.uSUARIO.findFirst({
      where: {
        email
      },
    });
    if (!user) {
      const data = await Prismaclient.uSUARIO.create({
        data: {
          email, 
          password : hashSync(password, JWT_ROUND), 
          rol: "USER",
        },
      });
      res.json(data);
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
  res.json("Hello im api");
};
