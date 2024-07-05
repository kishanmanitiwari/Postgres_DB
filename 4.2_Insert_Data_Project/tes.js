import express from 'express';
import {db,connect,disconnect} from './pgclient.js'
import bodyParser from 'body-parser'


//Instance

const app = express();

//Middlware

app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:true}));

app.get('/',async ()=>{
    try {
        connect();
        const result = await db.query('SELECT * FROM STUDENTS');
        console.log(result.rows);
    } catch (error) {
        console.log('Error Occured',error.stack);
    }finally{
        disconnect();
    }
})


//Server
app.listen(3000,()=>{
    console.log('Server is running on port 3000');
})