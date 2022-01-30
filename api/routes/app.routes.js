const cuponesController = require("../controllers/cupones.controller");

const express = require("express");
const router = express.Router();

router.post("/cupones", cuponesController.create);
router.get("/cupones", cuponesController.findAll);
router.get("/cupones/:id", cuponesController.findOne);
router.put("/cupones/:id", cuponesController.update);
router.delete("/cupones/:id", function(req, res){
    cuponesController.delete});

module.exports = router;