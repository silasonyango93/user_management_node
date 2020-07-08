var mysql = require('mysql');
var dbcredentials;


const con = mysql.createPool({
    host: "localhost",
    user: "silas",
    password: "8032",
    database: "users_management_template",
    insecureAuth: true
});
setInterval(() => {
    con.query("SELECT 1", (err, rows) => {
        if (err) throw err;
    });
}, 1000);




module.exports=con;
