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

const showShelves = async () => {
    let sql = `CALL show_shelves();`;
    let res = await db.query(sql);

    return res[0];
};

const showProducts = async () => {
    let sql = `CALL show_products_limited();`;
    let res = await db.query(sql);

    return res[0];
};

const showLog = async (limit) => {
    let sql = `CALL show_log(?);`;
    let res = await db.query(sql, [limit]);

    return res[0];
};

const showInventory = async () => {
    let sql = `CALL show_inventory();`;
    let res = await db.query(sql);

    return res[0];
};

const inventorySerach = async (str) => {
    let sql = `CALL search_inventory(?);`;
    let res = await db.query(sql, [`%${str}%`]);

    return res[0];
};

const addProducts = async (id, shelf, numb) => {
    let sql = `CALL insert_amount(?, ?, ?);`;

    await db.query(sql, [id, shelf, numb]);
};

const updateProducts = async (id, shelf, numb) => {
    let sql = `CALL update_amount(?, ?, ?);`;

    await db.query(sql, [id, shelf, numb]);
};

const showOrders = async () => {
    let sql = `CALL show_orders();`;
    let res = await db.query(sql);

    return res[0];
};

const OrdersSearch = async (id) => {
    let sql = `CALL search_orders(?);`;
    let res = await db.query(sql, [id]);

    return res[0];
};

const showPicklist = async (id) => {
    let sql = `CALL picklist(?);`;
    let res = await db.query(sql, [id]);

    return res[0];
};

const shippOrder = async (id) => {
    let sql = `CALL update_order_status_shipped(?);`;

    await db.query(sql, [id]);

    console.log(`Order ${id} är nu skickad`);
};

const payInvoicce = async (id, date) => {
    let sql = `CALL pay_invoice(?, ?);`;

    await db.query(sql, [id, date]);
};

module.exports = {
    showShelves: showShelves,
    showProducts: showProducts,
    showLog: showLog,
    showInventory: showInventory,
    inventorySerach: inventorySerach,
    addProducts: addProducts,
    updateProducts: updateProducts,
    showOrders: showOrders,
    OrdersSearch: OrdersSearch,
    showPicklist: showPicklist,
    shippOrder: shippOrder,
    payInvoicce: payInvoicce
};
