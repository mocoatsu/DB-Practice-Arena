-- CreateTable
CREATE TABLE `Branch` (
    `branchCode` VARCHAR(191) NOT NULL,
    `branchName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`branchCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Shop` (
    `branchCode` VARCHAR(191) NOT NULL,
    `shopCode` VARCHAR(191) NOT NULL,
    `shopName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`branchCode`, `shopCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StoreProduct` (
    `branchCode` VARCHAR(191) NOT NULL,
    `shopCode` VARCHAR(191) NOT NULL,
    `productCode` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`branchCode`, `shopCode`, `productCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `productCode` VARCHAR(191) NOT NULL,
    `productName` VARCHAR(191) NOT NULL,
    `productCategoryCode` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`productCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ProductCategory` (
    `productCategoryCode` VARCHAR(191) NOT NULL,
    `categoryName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`productCategoryCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Shop` ADD CONSTRAINT `Shop_branchCode_fkey` FOREIGN KEY (`branchCode`) REFERENCES `Branch`(`branchCode`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StoreProduct` ADD CONSTRAINT `StoreProduct_branchCode_shopCode_fkey` FOREIGN KEY (`branchCode`, `shopCode`) REFERENCES `Shop`(`branchCode`, `shopCode`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StoreProduct` ADD CONSTRAINT `StoreProduct_productCode_fkey` FOREIGN KEY (`productCode`) REFERENCES `Product`(`productCode`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_productCategoryCode_fkey` FOREIGN KEY (`productCategoryCode`) REFERENCES `ProductCategory`(`productCategoryCode`) ON DELETE RESTRICT ON UPDATE CASCADE;
