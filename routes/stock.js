"use strict";

const express = require("express");
const router = express.Router();
const eshop = require("../src/eshop.js");

router.get("/stock", async (req, res) => {
    let data = {
        title: "Lager | Miyahon",
        products: await eshop.showInventory()
    };

    res.render("stock.ejs", data);
});

router.get("/stock/edit/:id&:shelf", async (req, res) => {
    let id = req.params.id;
    let shelf = req.params.shelf;
    let data = {
        title: `Uppdatera ${id} | Miyahon`,
        info: await eshop.showInfoShelf(id, shelf)
    };

    res.render("forms/update-shelf.ejs", data);
});

router.post("/stock/edit/:id&:shelf", async (req, res) => {
    await eshop.updateShelf(req.body.id, req.body.shelf, req.body.amount);

    res.redirect("/eshop/stock");
});

router.get("/stock/create", async (req, res) => {
    let data = {
        title: "Lägg till ny produkt | Miyahon",
    };

    res.render("forms/add-product.ejs", data);
});

router.post("/stock/create", async (req, res) => {
    await eshop.createShelfRow(req.body.id, req.body.shelf, req.body.amount);
    res.redirect("/eshop/stock");
});

module.exports = router;
