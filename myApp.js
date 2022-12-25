require('dotenv').config();
const mongoose = require('mongoose');

mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });


// mongo.connect('mongodb+srv://catalin221:xqLpbr4ftyur7829@cluster0.qtwfddd.mongodb.net/?retryWrites=true&w=majority', 
//             { useNewUrlParser: true, useUnifiedTopology: true });

var bodyParser = require('body-parser');

const e = require('express');
let express = require('express');
const { Mongoose, mongo } = require('mongoose');
let app = express();

app.use(bodyParser.urlencoded({extended : false}));
app.use("/public", express.static(__dirname + "/public"));
app.use((req, res, next) => {
    console.log(req.method + " " + req.path + " - " + req.ip);
    next();
});

app.get("/", (req, res) => { res.sendFile(__dirname + "/views/index.html") });

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

app.get("/now", (req, res, next) => {
    req.time = new Date().toString();
    next();

}, (req, res) => {
    res.json({time: req.time
    });
});

app.get("/:word/echo", (req, res) =>{
    res.json({
        echo: req.params.word
    });
});

app.get("/name", (req, res) => {
    var firstName = req.query.first;
    var lastName = req.query.last;
    
    res.json({
        name: `${firstName} ${lastName}`
    })
});

app.post("/name", (req, res) => {
    var fullName = req.body.first + " " + req.body.last;
    res.json({ name: fullName });
});

































module.exports = app;
