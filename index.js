var coffee = require("coffeescript");
var File = require("fs");
if (!require.extensions[".coffee"]) {
  require.extensions[".coffee"] = function (module, filename) {
    var source = coffee.compile(File.readFileSync(filename, "utf8"));
    return module._compile(source, filename);
  };
}
module.exports.fabricate = require("./node/fabricate.coffee");
module.exports.server = require("./node/server.coffee");
module.exports.fabricate2 = require("./node/fabricate2.coffee");
module.exports.positronServer = require("./node/positron_server.coffee");