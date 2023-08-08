import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const categories = ['Electronics', 'Groceries', 'Clothing', 'Furniture', 'Books'];
  for (const category of categories) {
    await prisma.productCategory.create({
      data: { productCategoryCode: category.toLowerCase(), categoryName: category },
    });
  }

  const branches = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Miami'];
  for (const branch of branches) {
    await prisma.branch.create({
      data: { branchCode: branch.toLowerCase().replace(' ', ''), branchName: `${branch} Branch` },
    });
  }

  for (let i = 1; i <= 5; i++) {
    await prisma.shop.create({
      data: {
        branchCode: branches[i - 1].toLowerCase().replace(' ', ''),
        shopCode: `shop${i}`,
        shopName: `Shop ${i}`,
      },
    });
  }

  const products = ['Laptop', 'Bread', 'Jeans', 'Sofa', 'Novel'];
  for (let i = 0; i < products.length; i++) {
    await prisma.product.create({
      data: {
        productCode: `product${i + 1}`,
        productName: products[i],
        productCategoryCode: categories[i].toLowerCase(),
      },
    });
  }

  for (let i = 1; i <= 5; i++) {
    await prisma.storeProduct.create({
      data: {
        branchCode: branches[i - 1].toLowerCase().replace(' ', ''),
        shopCode: `shop${i}`,
        productCode: `product${i}`,
      },
    });
  }
}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
