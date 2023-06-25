const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send("Hello World!");
});
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use("/pelanggan", require("./routers/pelanggan"));
app.use("/pemesanan", require("./routers/pemesanan"));
app.use("/kota", require("./routers/kota"));

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
