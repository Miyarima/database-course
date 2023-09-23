/**
 *
 * @author Jonathan Göransson
 *
 */
"use strict";


const readline = require("readline-promise").default;
const task = require("./src/tasks.js");
const cli = require("./src/cli.js");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

(async function() {
    rl.setPrompt("eshop: ");
    rl.prompt();

    rl.on("line", async (input) => {
        input = input.trim();
        let parts = input.split(" ");

        switch (parts[0]) {
            case "exit":
            case "quit":
                task.exitProgram();
                break;
            case "menu":
                task.showMenu();
                break;
            case "about": {
                console.log("Jonathan Göransson");
                break;
            }
            case "log": {
                let res = await cli.showLog(parts[1]);

                console.table(res);
                break;
            }
            case "product": {
                let res = await cli.showProducts();

                console.table(res);
                break;
            }
            case "shelf": {
                let res = await cli.showShelves();

                console.table(res);
                break;
            }
            case "inv": {
                let res;

                if (parts[1]) {
                    res = await cli.inventorySerach(parts[1]);
                } else {
                    res = await cli.showInventory();
                }

                console.table(res);
                break;
            }
            case "invadd": {
                await cli.addProducts(parts[1], parts[2], parts[3]);
                let res = await cli.showInventory();

                console.table(res);
                break;
            }
            case "invdel": {
                await cli.updateProducts(parts[1], parts[2], parts[3]);
                let res = await cli.showInventory();

                console.table(res);
                break;
            }
            case "order": {
                let res;

                if (parts[1]) {
                    res = await cli.OrdersSearch(parseInt(parts[1]));
                } else {
                    res = await cli.showOrders();
                }

                console.table(res);
                break;
            }
            case "picklist": {
                let res = await cli.showPicklist(parseInt(parts[1]));

                console.table(res);
                break;
            }
            case "payed": {
                await cli.payInvoicce(parseInt(parts[1]), parts[2]);

                console.log(`Order: ${parts[1]} has been paid on ${parts[2]}`);
                break;
            }
            case "ship": {
                let res = await cli.showPicklist(parseInt(parts[1]));

                for (const row of res) {
                    try {
                        await cli.updateProducts(row.id, row.hylla, row.antal);
                    } catch (error) {
                        console.log(`${row.id} kan inte bli skickad då den är slut i lagret.`);
                    }
                }
                await cli.shippOrder(parseInt(parts[1]));

                break;
            }
            default:
                console.log(`"${input}" is not a command`);
                task.showMenu();
                break;
        }

        rl.prompt();
    });
})();
