const mysql = require('mysql2');
const {promisify}=require('util');
const {database} = require('./keys');

const pool = mysql.createPool(database);

pool.getConnection((err,connection)=>{

    if(err){
        if(err.code=== 'PROTOCOL_CONNECTION_LOST'){
            console.log('database was closed');
        }
        if(err.code=== 'ER_CON_COUNT_ERROR'){
            console.log('database has to many connections');
        }
        if(err.code=== 'ECONNREFUSED'){
            console.log('database was refused');
        }
        if(err){
            console.error('error al conectar');
            throw err;
        }
    }else if(connection){connection.release();
    console.log('DB is connected succesfuly');}
    return;
});

pool.query=promisify(pool.query);

module.exports = pool;