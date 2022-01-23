const express = require('express');
const app = express();
const port = 3000;
const axios = require('axios');
const token = process.env.SUPERVISOR_TOKEN;

app.get('/api', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

axios.get('http://supervisor/addons/local_auto-snapshot-backups/info', {
headers: {
  'Authorization': `Bearer ${token}`,
  'Content-Type': 'application/json'
}
})
.then(response => {
  console.log(response.data);
})
.catch(error =>{
  console.error(error);
});
