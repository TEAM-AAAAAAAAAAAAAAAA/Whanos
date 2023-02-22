const fs = require('fs');
const Befunge = require('befunge93');

let b93 = new Befunge();
b93.onOutput = (output) => {process.stdout.write(output)};
b93.run(fs.readFileSync(process.argv[1]).toString());
