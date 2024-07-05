import pg from 'pg';
import dotenv from "dotenv";


dotenv.config();

const db = new pg.Client(
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

async function disconnect() {
    try {
        await db.end();
        console.log('Disconnected from DB');
    } catch (error) {
        console.log('Connection error',err.stack);
    }
}



export {db,connect,disconnect};
export default db;