import { Client } from "pg";
import dotenv from "dotenv";

dotenv.config();

export async function db() {
    const db = new Client({
        user: process.env.DB_USER,
        host: process.env.DB_HOST,
        database: process.env.DB_NAME,
        password: process.env.DB_PASSWORD,
        port: process.env.DB_PORT,
    });

    try {
        await db.connect();
        console.log("Connected successfully to the database");
        return db;
    } catch (err) {
        console.error("Error connecting to the database", err);
        throw err;
    }
}
