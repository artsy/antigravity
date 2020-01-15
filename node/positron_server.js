const express = require("express")
const fabricate = require("./fabricate")

/*
 * Fake positron express app
 */
const positron = (module.exports = express())

positron.get("/api/articles", (req, res) =>
  res.send({ total: 1, count: 1, results: [fabricate("article")] })
)
