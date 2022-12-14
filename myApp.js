let express = require('express');
let app = express();
app.get("/json", (req, res) => {
    res.json({
        message: "Hello json"
    });
});
app.use("/public", express.static(__dirname + "/public"));




































 module.exports = app;
