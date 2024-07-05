
import {Client} from 'pg';
import dotenv from "dotenv";


dotenv.config();

const db = new Client(
    {
        user: process.env.DB_USER,
        host: process.env.DB_HOST,
        database: process.env.DB_NAME,
        password: process.env.DB_PASSWORD,
        port: process.env.DB_PORT,
      }
)

async function connect() {
    try {
        await db.connect();
        console.log('Conneted to DB');
    } catch (error) {
        console.log('Connection error',err.stack);
    }
}

export {db,connect};