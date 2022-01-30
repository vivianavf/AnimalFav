const cuponesServices = require("../services/cupones.services");
const upload = require("../middleware/upload.js");

exports.create = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");
            const path = req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                cuponName: req.body.cuponName,
                cuponLocal: req.body.cuponLocal,
                cuponFecha: req.body.cuponFecha,
                cuponBeneficio: req.body.cuponBeneficio,
                cuponCodigo: req.body.cuponCodigo,
                cuponCategoria: req.body.cuponCategoria,
                cuponesImage: path != "" ? url + "/" + path : "",
            };

            cuponesServices.createcupones(model, (error, results) => {
                if (error) {
                    return next(error);
                } else {
                    return res.status(200).send({
                        message: "Success",
                        data: results,
                    })
                }
            });
        }
    });
};

exports.findAll = (req, res, next) => {
    var model = {
        cuponName: req.query.cuponName,
    };

    cuponesServices.getcupones(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results,
            });
        }
    });
};

exports.findOne = (req, res, next) => {
    var model = {
        cuponesId: req.params.id,
    };

    cuponesServices.getcuponesById(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results,
            });
        }
    });
};

exports.update = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");
            const path = req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                cuponId: req.params.id,
                cuponName: req.body.cuponName,
                cuponLocal: req.body.cuponLocal,
                cuponFecha: req.body.cuponFecha,
                cuponBeneficio: req.body.cuponBeneficio,
                cuponCodigo: req.body.cuponCodigo,
                cuponCategoria: req.body.cuponCategoria,
                cuponImage: path != "" ? url + "/" + path : "",
            };

            cuponesServices.updatecupones(model, (error, results) => {
                if (error) {
                    return next(error);
                } else {
                    return res.status(200).send({
                        message: "Success",
                        data: results,
                    })
                }
            });
        }
    });
};

exports.detele = (req, res, next) => {
    var model = {
        cuponesId: req.params.id,
    };

    cuponesServices.deletecupones(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results,
            });
        }
    });
};