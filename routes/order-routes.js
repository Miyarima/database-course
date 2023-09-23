"use strict";

const express = require("express");
const router = express.Router();
const eshop = require("../src/eshop.js");

router.get("/order", async (req, res) => {
    let data = {
        title: `Orders | Miyahon`,
        orders: await eshop.showOrders()
    };

    res.render("forms/customer-orders.ejs", data);
});

router.get("/customer/order/:order&:name", async (req, res) => {
    let name = req.params.name;
    let order = req.params.order;
    let data = {
        title: `Order: ${name} | Miyahon`,
        kund: name,
        orderNummer: order,
        products: await eshop.showOrderProducts()
    };

    res.render("forms/order.ejs", data);
});

router.post("/customer/order/:order&:name", async (req, res) => {
    await eshop.createOrderRow(req.body.order, req.body.name, req.body.numb, req.body.cost);

    res.redirect(`/eshop/customer/order/${req.body.order}&${req.body.customer}`);
});

router.get("/customer/order/cart/:order&:name", async (req, res) => {
    let order = req.params.order;
    let name = req.params.name;
    let data = {
        title: `Order: ${name} | Miyahon`,
        kund: name,
        orderNummer: order,
        products: await eshop.showCart(order)
    };

    res.render("cart.ejs", data);
});

router.get("/customer/order/overview/:order&:name", async (req, res) => {
    let order = req.params.order;
    let name = req.params.name;
    let data = {
        title: `Order översikt | Miyahon`,
        kund: name,
        orderNummer: order,
        products: await eshop.showCart(order),
        orderDetails: await eshop.showOrderOverview(order)
    };

    res.render("order-overview.ejs", data);
});

router.post("/customer/ordering", async (req, res) => {
    await eshop.updateOrderStatusOrdered(req.body.order);

    res.redirect(`/eshop/order`);
});

router.post("/customer/picklist", async (req, res) => {
    let data = {
        title: `Plocklista | Miyahon`,
        products: await eshop.showPicklist(req.body.order)
    };

    res.render("picklist.ejs", data);
});

router.post("/customer/invoice", async (req, res) => {
    let data = {
        title: `Faktura | Miyahon`,
        invoice: await eshop.showInvoice(req.body.order)
    };

    res.render("invoice.ejs", data);
});

router.post("/customer/ship", async (req, res) => {
    let list = await eshop.showPicklist(req.body.order);

    for (const row of list) {
        try {
            await eshop.updateAmount(row.id, row.hylla, row.antal);
        } catch (error) {
            console.log(`Error, ${row.id} kan inte bli skickad då den är slut i lagret.`);
        }
    }
    await eshop.shippOrder(req.body.order);

    res.redirect(`/eshop/order`);
});

module.exports = router;
