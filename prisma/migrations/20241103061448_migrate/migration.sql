/*
  Warnings:

  - You are about to drop the `ROL` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `rol` to the `USUARIO` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Rol" AS ENUM ('USUARIO', 'ADMINISTRADOR');

-- DropForeignKey
ALTER TABLE "USUARIO" DROP CONSTRAINT "USUARIO_rol_fk_fkey";

-- AlterTable
ALTER TABLE "USUARIO" ADD COLUMN     "rol" "Rol" NOT NULL;

-- DropTable
DROP TABLE "ROL";
