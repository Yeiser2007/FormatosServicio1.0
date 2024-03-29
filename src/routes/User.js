const express = require('express');
const router = express.Router();
const pool = require('../database');
const helpers = require('../lib/helpers');

router.get('/Ajustes',(req,res)=>{
    res.render('Paginas/Ajustes');
});
router.get('/ModificarUsuario',(req,res)=>{
    res.render('Paginas/cambioContra');
});

router.post('/ModificarUsuario',async (req,res)=>{
    const data ={usuario,ContraseñaActual,Contraseña,ConfirmarC}=req.body;
    const passA = await pool.query('select contrasenia from usuario where id_investigador = (select id_investigador from investigador where email_institu= ?)',usuario);
    console.log(passA);
    if(passA[0].contrasenia === ContraseñaActual){
        await pool.query('update usuario set contrasenia = ? where id_investigador = (select id_investigador from investigador where email_institu= ?)',[Contraseña,usuario]);
        req.flash('success','Contraseña modificada');
        const valid =  {
            verdad: "cierto"
        }
        res.render('Paginas/cambioContra',{valid});
    }else{
    console.log('error');       
    const valid =  {
        falso: "false"
    }
    req.flash('success','Error contraseña actual no coincido');
    res.render('Paginas/cambioContra',{valid});
    }
});


module.exports = router;