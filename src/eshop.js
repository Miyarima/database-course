/**
 *
 * @author Jonathan Göransson
 *
 */
"use strict";

const mysql = require("promise-mysql");
const config = require("../config/db/eshop.json");
let db;



/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

const showCategory = async () => {
    let sql = `CALL show_category();`;
    let res = await db.query(sql);

    return res[0];
};

const showProducts = async () => {
    let sql = `CALL show_products();`;
    let res = await db.query(sql);

    return res[0];
};

const showProductsAmount = async () => {
    let sql = `CALL show_products_amount();`;
    let res = await db.query(sql);

    return res[0];
};

const showOrderProducts = async () => {
    let sql = `CALL show_order_products();`;
    let res = await db.query(sql);

    return res[0];
};

const createProduct = async (data) => {
    let sql = `CALL add_product(?, ?, ?, ?, ?);`;

    await db.query(sql, Object.values(data));
};

const addProductCategories = async (id, data) => {
    data.forEach(async function (category) {
        let sql = `CALL add_product_categories(?, ?);`;

        await db.query(sql, [id, category]);
    });
};

const createOrder = async (id) => {
    let sql = `CALL create_order(?);`;

    await db.query(sql, Object.values(id));
};

const createOrderRow = async (oId, pId, amount, price) => {
    let sql = `CALL create_order_row(?, ?, ?, ?);`;

    await db.query(sql, [oId, pId, amount, price]);
};

const createShelfRow = async (id, shelf, amount) => {
    let sql = `CALL create_shelf_row(?, ?, ?);`;

    await db.query(sql, [id, shelf, amount]);
};

const updateProduct = async (data) => {
    let sql = `CALL update_product(?, ?, ?, ?, ?);`;

    await db.query(sql, Object.values(data));
};

const updateShelf = async (id, shelf, amount) => {
    let sql = `CALL update_shelf(?, ?, ?);`;

    await db.query(sql, [id, shelf, amount]);
};

const deleteProduct = async (data) => {
    let sql = `CALL delete_product(?);`;

    await db.query(sql, Object.values(data));
};

const showInfoProduct = async (id) => {
    let sql = `CALL show_info_product(?);`;

    let res = await db.query(sql, [id]);

    return res[0];
};

const showInfoShelf = async (id, shelf) => {
    let sql = `CALL show_info_shelf(?, ?);`;

    let res = await db.query(sql, [id, shelf]);

    return res[0];
};

const showCustomer = async () => {
    let sql = `CALL show_customer();`;
    let res = await db.query(sql);

    return res[0];
};

const showOrders = async () => {
    let res = await db.query(`CALL show_orders();`);

    return res[0];
};

const showCart = async (id) => {
    let sql = `CALL show_order(?);`;
    let res = await db.query(sql, [id]);

    return res[0];
};

const showOrderOverview = async (id) => {
    let sql = `CALL show_order_overview(?);`;
    let res = await db.query(sql, [id]);

    return res[0];
};

const updateOrderStatusOrdered = async (id) => {
    let sql = `CALL update_order_status_orderd(?);`;

    await db.query(sql, [id]);
};

const showInventory = async () => {
    let sql = `CALL show_inventory();`;
    let res = await db.query(sql);

    return res[0];
};

const showPicklist = async (id) => {
    let sql = `CALL picklist(?);`;
    let res = await db.query(sql, [id]);

    return res[0];
};

const updateAmount = async (id, shelf, numb) => {
    let sql = `CALL update_amount(?, ?, ?);`;

    await db.query(sql, [id, shelf, numb]);
};

const shippOrder = async (id) => {
    let sql = `CALL update_order_status_shipped(?);`;

    await db.query(sql, [id]);
};

const showInvoice = async (id) => {
    let sql = `CALL show_invoice(?);`;
    let res = await db.query(sql, [id]);

    return res[0];
};

module.exports = {
    showCategory: showCategory,
    showProducts: showProducts,
    showProductsAmount: showProductsAmount,
    createProduct: createProduct,
    showInfoProduct: showInfoProduct,
    updateProduct: updateProduct,
    deleteProduct: deleteProduct,
    showCustomer: showCustomer,
    showOrderProducts: showOrderProducts,
    showOrders: showOrders,
    createOrder: createOrder,
    createOrderRow: createOrderRow,
    showCart: showCart,
    updateOrderStatusOrdered: updateOrderStatusOrdered,
    showOrderOverview: showOrderOverview,
    addProductCategories: addProductCategories,
    showInventory: showInventory,
    showInfoShelf: showInfoShelf,
    updateShelf: updateShelf,
    createShelfRow: createShelfRow,
    showPicklist: showPicklist,
    updateAmount: updateAmount,
    shippOrder: shippOrder,
    showInvoice: showInvoice
};
