const express = require("express");
const enPoint = express.Router();
const controller = require("../controller/pemesanan");

enPoint.post("/input", controller.postData);
enPoint.get("/show", controller.showData);
enPoint.get("/show/:id", controller.showDataByID);
enPoint.put("/update/:id", controller.updateDataByID);
enPoint.delete("/delete/:id", controller.deleteDataByID);

module.exports = enPoint;
