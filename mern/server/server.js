import express from "express";
import cors from "cors";
import records from "./routes/record.js";
import db from "./db/connection.js";

const PORT = process.env.PORT || 5050;
const app = express();

app.use(cors());
app.use(express.json());


app.get("/health", async (req, res) => {
  try {
    await db.command({ping: 1});
    res.status(200).json({
      status: "UP",
      database: "UP"
    });
  } catch (error){
    res.status(503).json({
      status: "DOWN",
      database: "DOWN"
    });
  }
})

app.use("/record", records);

// start the Express server
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
