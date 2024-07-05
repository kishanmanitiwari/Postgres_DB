import express from 'express';
import pg from 'pg';
import bodyParser from 'body-parser'
import dotenv from 'dotenv'


//Instance
dotenv.config();
const app = express();

//Middlware

app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:true}));

//DB Stuff

const db = new pg.Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

db.connect()

//Route

app.get('/',async (req,res)=>{
    let allStudents;
    try {
        const query = `SELECT name FROM STUDENTS`;
        const result = await db.query(query);
        allStudents = result.rows;
    } catch (error) {
        console.log('Error to fetch studemts',error.stack);
    }
    res.render('index.ejs',{students:allStudents})
});

app.post('/new',async (req,res)=>{

    const {userName,userAge,userCity} = req.body;
    const query = `INSERT INTO STUDENTS(name,age,city) VALUES ($1,$2,$3) RETURNING *`;
    const inputData = [userName,userAge,userCity];

    try {
        const data = await db.query(query,inputData);
        console.log(data.rows);
    } catch (error) {
        console.log("Failed to add student",err.stack);
    }

    res.redirect('/');


})


//Server
app.listen(3000,()=>{
    console.log('Server is running on port 3000');
})