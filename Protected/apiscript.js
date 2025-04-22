import fs from 'fs';
import path from 'path';

export default function handler(req, res) {
  const secretKey = "my_super_secret_key"; // Replace with your secret key

  // Check if the key in the URL matches the secret key
  if (req.query.key !== secretKey) {
    return res.status(403).send("-- Invalid key");
  }

  // Read the Lua script file and send it as the response
  const filePath = path.join(process.cwd(), 'Protected_1.lua');
  const script = fs.readFileSync(filePath, 'utf8');

  res.setHeader("Content-Type", "text/plain");
  res.send(script);
}
