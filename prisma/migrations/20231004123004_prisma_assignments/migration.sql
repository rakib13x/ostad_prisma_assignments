-- DropForeignKey
ALTER TABLE `categories` DROP FOREIGN KEY `id`;

-- DropForeignKey
ALTER TABLE `customers` DROP FOREIGN KEY `customers_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `customers_id`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `users_id`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `categories_id`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `user_id`;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_customers_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_users_id_foreign` FOREIGN KEY (`id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_categories_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_user_id_Foreign` FOREIGN KEY (`id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER TABLE `categories` RENAME INDEX `id` TO `categories_user_id_foreign`;

-- RenameIndex
ALTER TABLE `customers` RENAME INDEX `customers_id_idx` TO `customers_user_id_Foreign`;

-- RenameIndex
ALTER TABLE `invoice_products` RENAME INDEX `invoice_products_invoice_id_foreign` TO `invoice_products_invoices_id_foreign`;

-- RenameIndex
ALTER TABLE `invoice_products` RENAME INDEX `invoice_products_product_id_foreign` TO `invoice_products_products_id_foreign`;

-- RenameIndex
ALTER TABLE `invoices` RENAME INDEX `customer_id` TO `invoices_customers_id_foreign`;

-- RenameIndex
ALTER TABLE `invoices` RENAME INDEX `users_id` TO `invoices_users_id_foreign`;

-- RenameIndex
ALTER TABLE `products` RENAME INDEX `categories_id` TO `products_categories_id_foreign`;

-- RenameIndex
ALTER TABLE `products` RENAME INDEX `user_id` TO `products_user_id_foreign`;
