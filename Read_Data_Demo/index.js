import express from "express";
import pg from "pg";


//Instance
const app = express();



const db = new pg.Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});


//Connect it to db

db.connect();

// //Database disconnect

// db.end()

//Read data from DB

app.get('/',async (req,res)=>{
  try {
    const data = await db.query('SELECT * FROM flag');
    res.json(data.rows);
    console.log(data.rows);
    db.end();
    
  } catch (error) {
    console.log('Error occured',error.stack);
  }

})


//Server
app.listen(3000, () => {
  console.log(`Server running on port 3000`);
});
