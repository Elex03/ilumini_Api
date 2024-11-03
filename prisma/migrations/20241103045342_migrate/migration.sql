-- CreateTable
CREATE TABLE "users" (
    "usuer_pk" SERIAL NOT NULL,
    "correo" VARCHAR(30) NOT NULL,
    "contrasena" VARCHAR(15) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("usuer_pk")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_correo_key" ON "users"("correo");
