"use strict";

const express = require("express");
const port = 1337;
const app = express();
const path = require("path");
const indexRoutes = require("./routes/routes.js");
const productRoutes = require("./routes/product-routes.js");
const orderRoutes = require("./routes/order-routes.js");
const stockRoutes = require("./routes/stock.js");

app.set('views', './views/pages');
app.set('view engine', 'ejs');
// app.use(express.static('public'));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({extended: false}));

app.use("/eshop", indexRoutes);
app.use("/eshop", productRoutes);
app.use("/eshop", orderRoutes);
app.use("/eshop", stockRoutes);

app.listen(port, () => {
    console.log(`Server listening on port: ${port}`);
});
