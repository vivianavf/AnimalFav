const {cupon} = require("../models/cupones.models");

async function createcupones(params, callback){
    if(!params.cuponName){
        return callback(
            {
                message: "cupon Name Required",
            },
            ""
        );
    }

    const cuponModel = new cupon(params);
    cuponModel
    .save()
    .then((response) => {
        return callback(null, response);
    })
    .catch((error) => {
        return callback(error);
    });
}

async function getcupones(params, callback){
    const cuponName = params.cuponName;
    var condition = cuponName 
    ? {
        cuponName: { $regex : new RegExp(cuponName), $option: "i"},
    }
    : {};

    cupon
    .find(condition)
    .then((response) => {
        return callback(null, response);
    })
    .catch((error) => {
        return callback(error);
    });
}

async function getcuponById(params, callback){
    const cuponId = params.cuponId;
    
    cupon
    .findById(cuponId)
    .then((response) => {
    if(!response) callback("No encontramos :(");
    else
        return callback(null, response);
    })
    .catch((error) => {
        return callback(error);
    });
}

async function updatecupon(params, callback){
    const cuponId = params.cuponId;
    
    cupon
    .findByIdAndUpdate(cuponId, params, {useFindAndModify: false})
    .then((response) => {
    if(!response) callback("No se puede hacer el update");
    else
        return callback(null, response);
    })
    .catch((error) => {
        return callback(error);
    });
}

async function deletecupon(params, callback){
    const cuponId = params.cuponId;
    
    cupon
    .findByIdAndRemove(cuponId)
    .then((response) => {
    if(!response) callback("No se puede eliminar :( ");
    else
        return callback(null, response);
    })
    .catch((error) => {
        return callback(error);
    });
}

module.exports = {
    createcupones,
    getcupones,
    getcuponById,
    updatecupon,
    deletecupon
}