const express = require("express");
const app = express();
const port = 3000;

function factorial(n) {
  if (n < 2) return 1;
  return factorial(n - 1) * n;
}

app.get("/:num", (req, res) => {
  const n = req.params.num ? req.params.num : 0;
  const fact = factorial(n);
  res.send("" + fact);
});

app.listen(port, () => {
  console.log(`server started on port ${port}`);
});
