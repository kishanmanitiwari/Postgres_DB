import express from 'express';
import db from './pgClient.js';
import bodyParser from 'body-parser';
import dotenv from "dotenv";

//Instance
dotenv.config();
const app = express();

//Middlware

app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:true}));


const PORT = process.env.PORT || 3000;

//Routes

app.get('/',(req,res)=>{
    res.send('Home Route');
});


//Server
app.listen(PORT, () => {
    console.log(`Server listening on port PORT`);
  })