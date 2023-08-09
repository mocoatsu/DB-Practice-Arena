/*
  Warnings:

  - You are about to drop the `store` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `StoreProduct` DROP FOREIGN KEY `StoreProduct_branchCode_storeCode_fkey`;

-- DropForeignKey
ALTER TABLE `store` DROP FOREIGN KEY `store_branchCode_fkey`;

-- DropTable
DROP TABLE `store`;

-- CreateTable
CREATE TABLE `Store` (
    `branchCode` VARCHAR(191) NOT NULL,
    `storeCode` VARCHAR(191) NOT NULL,
    `storeName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`branchCode`, `storeCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Store` ADD CONSTRAINT `Store_branchCode_fkey` FOREIGN KEY (`branchCode`) REFERENCES `Branch`(`branchCode`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StoreProduct` ADD CONSTRAINT `StoreProduct_branchCode_storeCode_fkey` FOREIGN KEY (`branchCode`, `storeCode`) REFERENCES `Store`(`branchCode`, `storeCode`) ON DELETE RESTRICT ON UPDATE CASCADE;
