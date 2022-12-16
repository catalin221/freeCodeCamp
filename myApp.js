require('dotenv').config();

const e = require('express');
let express = require('express');
let app = express();
app.get("/", (req, res) => { res.sendFile(__dirname + "/views/index.html") });

app.use("/public", express.static(__dirname + "/public"));
app.get("/json", (req, res) => {
    if (process.env.MESSAGE_STYLE === "uppercase") {
        res.json({
            message: "Hello json".toUpperCase()
        });
    }
    else {
        res.json({
            message: "Hello json"
        });
    }
});

app.use(function middleware(req,res, next) {
    console.log(req.method + ' ' + req.path + " - " + req.ip);
    next();
})




































module.exports = app;
