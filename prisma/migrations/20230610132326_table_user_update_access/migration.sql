-- AlterTable
ALTER TABLE "User" ADD COLUMN     "accessId" INTEGER;

-- CreateTable
CREATE TABLE "Condominios" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Condominios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Access" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Access_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Servicos" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "condominiosId" INTEGER,

    CONSTRAINT "Servicos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tipos_Equipamentos" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "equipamentosId" INTEGER,
    "servicosId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tipos_Equipamentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipamentos" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Equipamentos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Condominios_endereco_key" ON "Condominios"("endereco");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_accessId_fkey" FOREIGN KEY ("accessId") REFERENCES "Access"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Servicos" ADD CONSTRAINT "Servicos_condominiosId_fkey" FOREIGN KEY ("condominiosId") REFERENCES "Condominios"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tipos_Equipamentos" ADD CONSTRAINT "Tipos_Equipamentos_equipamentosId_fkey" FOREIGN KEY ("equipamentosId") REFERENCES "Equipamentos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tipos_Equipamentos" ADD CONSTRAINT "Tipos_Equipamentos_servicosId_fkey" FOREIGN KEY ("servicosId") REFERENCES "Servicos"("id") ON DELETE SET NULL ON UPDATE CASCADE;
