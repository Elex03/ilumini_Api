/*
  Warnings:

  - The values [USUARIO,ADMINISTRADOR] on the enum `Rol` will be removed. If these variants are still used in the database, this will fail.
  - The primary key for the `USUARIO` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `contrasena` on the `USUARIO` table. All the data in the column will be lost.
  - You are about to drop the column `correo` on the `USUARIO` table. All the data in the column will be lost.
  - You are about to drop the column `usuario_pk` on the `USUARIO` table. All the data in the column will be lost.
  - You are about to drop the `FACTURA` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FAC_PRODUCTO` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FORMA_PAGO` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FPago_CLIENTE` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `INVENTARIO` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MATERIAL` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PERSONA` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PRODUCTOS` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PRO_IMPRESION` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PRO_POSTERS` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PRO_SERIGRAFIADO` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `REGISTRO` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SERVICIO_BANCARIO` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `email` to the `USUARIO` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `USUARIO` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Rol_new" AS ENUM ('USER', 'ADMIN');
ALTER TABLE "USUARIO" ALTER COLUMN "rol" TYPE "Rol_new" USING ("rol"::text::"Rol_new");
ALTER TYPE "Rol" RENAME TO "Rol_old";
ALTER TYPE "Rol_new" RENAME TO "Rol";
DROP TYPE "Rol_old";
COMMIT;

-- DropForeignKey
ALTER TABLE "FACTURA" DROP CONSTRAINT "FACTURA_formaPago_fk_fkey";

-- DropForeignKey
ALTER TABLE "FAC_PRODUCTO" DROP CONSTRAINT "FAC_PRODUCTO_factura_fk_fkey";

-- DropForeignKey
ALTER TABLE "FAC_PRODUCTO" DROP CONSTRAINT "FAC_PRODUCTO_producto_fk_fkey";

-- DropForeignKey
ALTER TABLE "FORMA_PAGO" DROP CONSTRAINT "FORMA_PAGO_servicio_fk_fkey";

-- DropForeignKey
ALTER TABLE "FPago_CLIENTE" DROP CONSTRAINT "FPago_CLIENTE_cliente_fk_fkey";

-- DropForeignKey
ALTER TABLE "FPago_CLIENTE" DROP CONSTRAINT "FPago_CLIENTE_forma_fk_fkey";

-- DropForeignKey
ALTER TABLE "INVENTARIO" DROP CONSTRAINT "INVENTARIO_producto_fk_fkey";

-- DropForeignKey
ALTER TABLE "PERSONA" DROP CONSTRAINT "PERSONA_usuario_fk_fkey";

-- DropForeignKey
ALTER TABLE "PRO_IMPRESION" DROP CONSTRAINT "PRO_IMPRESION_producto_fk_fkey";

-- DropForeignKey
ALTER TABLE "PRO_POSTERS" DROP CONSTRAINT "PRO_POSTERS_producto_fk_fkey";

-- DropForeignKey
ALTER TABLE "PRO_SERIGRAFIADO" DROP CONSTRAINT "PRO_SERIGRAFIADO_material_fk_fkey";

-- DropForeignKey
ALTER TABLE "PRO_SERIGRAFIADO" DROP CONSTRAINT "PRO_SERIGRAFIADO_producto_fk_fkey";

-- DropForeignKey
ALTER TABLE "REGISTRO" DROP CONSTRAINT "REGISTRO_administrador_fk_fkey";

-- DropForeignKey
ALTER TABLE "REGISTRO" DROP CONSTRAINT "REGISTRO_producto_fk_fkey";

-- AlterTable
ALTER TABLE "USUARIO" DROP CONSTRAINT "USUARIO_pkey",
DROP COLUMN "contrasena",
DROP COLUMN "correo",
DROP COLUMN "usuario_pk",
ADD COLUMN     "email" VARCHAR(30) NOT NULL,
ADD COLUMN     "password" VARCHAR(20) NOT NULL,
ADD COLUMN     "user_pk" SERIAL NOT NULL,
ADD CONSTRAINT "USUARIO_pkey" PRIMARY KEY ("user_pk");

-- DropTable
DROP TABLE "FACTURA";

-- DropTable
DROP TABLE "FAC_PRODUCTO";

-- DropTable
DROP TABLE "FORMA_PAGO";

-- DropTable
DROP TABLE "FPago_CLIENTE";

-- DropTable
DROP TABLE "INVENTARIO";

-- DropTable
DROP TABLE "MATERIAL";

-- DropTable
DROP TABLE "PERSONA";

-- DropTable
DROP TABLE "PRODUCTOS";

-- DropTable
DROP TABLE "PRO_IMPRESION";

-- DropTable
DROP TABLE "PRO_POSTERS";

-- DropTable
DROP TABLE "PRO_SERIGRAFIADO";

-- DropTable
DROP TABLE "REGISTRO";

-- DropTable
DROP TABLE "SERVICIO_BANCARIO";
