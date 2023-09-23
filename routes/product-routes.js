"use strict";

const express = require("express");
const router = express.Router();
const eshop = require("../src/eshop.js");

router.get("/product", async (req, res) => {
    let data = {
        title: "Produkt | Miyahon",
        products: await eshop.showProducts(),
        amount: await eshop.showProductsAmount()
    };

    res.render("product.ejs", data);
});

router.get("/product/create", async (req, res) => {
    let data = {
        title: "Lägg till ny produkt | Miyahon",
    };

    res.render("forms/create-product.ejs", data);
});

router.post("/product/create", async (req, res) => {
    let categories = req.body.category.split(" ");

    await eshop.createProduct([
        req.body.id, req.body.price,
        req.body.name, req.body.picture,
        req.body.description
    ]);
    await eshop.addProductCategories(req.body.id, categories);
    await eshop.createShelfRow(req.body.id, req.body.shelf, req.body.amount);
    res.redirect("/eshop/product");
});

router.get("/product/edit/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Uppdatera ${id} | Miyahon`,
        info: await eshop.showInfoProduct(id)
    };

    res.render("forms/update-product.ejs", data);
});

router.post("/product/edit/:id", async (req, res) => {
    await eshop.updateProduct(req.body);
    res.redirect("/eshop/product");
});

router.get("/product/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Kmom06 | Miyahon`,
        info: await eshop.showInfoProduct(id)
    };

    res.render("forms/delete-product.ejs", data);
});

router.post("/product/delete/:id", async (req, res) => {
    await eshop.deleteProduct(req.body);
    res.redirect("/eshop/product");
});

module.exports = router;
