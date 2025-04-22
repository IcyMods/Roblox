import fs from 'fs';
import path from 'path';

export default function handler(req, res) {
  const secretKey = "my_super_secret_key"; // Change this to your secret key

  // If the key in the URL doesn't match the secret, return an error
  if (req.query.key !== secretKey) {
    return res.status(403).send("-- Invalid key");
  }

  // Load your Lua script from the file and send it as a response
  const filePath = path.join(process.cwd(), 'script.lua');
  const script = fs.readFileSync(filePath, 'utf8');

  res.setHeader("Content-Type", "text/plain");
  res.send(script);  // This sends the Lua script to the client
}
