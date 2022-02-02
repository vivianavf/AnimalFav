const cuponesServices = require("../services/cupones.services");
const upload = require("../middleware/upload.js");

//crear un nuevo cupon
exports.create = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");
            const path = 
                req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                cuponName: req.body.cuponName,
                cuponLocal: req.body.cuponLocal,
                cuponFecha: req.body.cuponFecha,
                cuponBeneficio: req.body.cuponBeneficio,
                cuponCodigo: req.body.cuponCodigo,
                cuponCategoria: req.body.cuponCategoria,
            };

            cuponesServices.createcupones(model, (error, results) => {
                if (error) {
                    return next(error);
                } else {
                    return res.status(200).send({
                        data: results,
                    })
                }
            });
        }
    });
};

//obtener todos los cupones
exports.findAll = (req, res, next) => {
    var model = {
        cuponName: req.body.cuponName,
        cuponLocal: req.body.cuponLocal,
        cuponFecha: req.body.cuponFecha,
        cuponBeneficio: req.body.cuponBeneficio,
        cuponCodigo: req.body.cuponCodigo,
        cuponCategoria: req.body.cuponCategoria,
    };

    cuponesServices.getcupones(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                data: results,
            });
        }
    });

};