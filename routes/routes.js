"use strict";

const express = require("express");
const router = express.Router();
const eshop = require("../src/eshop.js");

router.get("/", (req, res) => {
    let data = {
        title: "Index",
        today: new Date()
    };

    res.render("index.ejs", data);
});

router.get("/index", async (req, res) => {
    let data = {
        title: "Hem | Miyahon"
    };

    res.render("index.ejs", data);
});

router.get("/about", async (req, res) => {
    let data = {
        title: "Om | Miyahon"
    };

    res.render("about.ejs", data);
});

router.get("/category", async (req, res) => {
    let data = {
        title: "Kategori | Miyahon",
        category: await eshop.showCategory()
    };

    res.render("category.ejs", data);
});

router.get("/customer", async (req, res) => {
    let data = {
        title: "Kunder | Miyahon",
        kund: await eshop.showCustomer()
    };

    res.render("customer.ejs", data);
});

router.post("/customer", async (req, res) => {
    await eshop.createOrder(req.body);

    res.redirect("/eshop/order");
});

module.exports = router;
