/**
 *
 * @author Jonathan Göransson
 *
 */
"use strict";

function exitProgram(code=0) {
    console.log(`Program exits with status: ${code}`);
    process.exit(code);
}

function showMenu() {
    console.log(`
    Choose something from the menu:

    exit, quit                            - Exit program
    menu                                  - Shows this menu
    about                                 - Shows members of the group
    log <number>                          - Shows most recent events from the log
    product                               - Shows all products
    shelf                                 - Shows shelves in the storage
    inv                                   - Shows were the products are
    invadd <productid> <shelf> <number>   - Adds products to a shelf
    invdel <productid> <shelf> <number>   - Delets products from a shelf
    Order <search>                        - Shows orders
    picklist <orderid>                    - Shows picklist for the specified order
    ship <orderid>                        - Marks order as shipped
    payed <invoiceid> <date>              - Marks an invoice as paid (YYYY-MM-DD)
    `);
}

module.exports = {
    exitProgram: exitProgram,
    showMenu: showMenu
};
