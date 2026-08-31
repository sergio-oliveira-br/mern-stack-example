import express from "express";
import cors from "cors";
import records from "./routes/record.js";
import {checkDatabaseHealth} from "./db/connection.js";

const PORT = process.env.PORT || 5050;
const app = express();

app.use(cors());
app.use(express.json());


app.get("/health/ready", async (req, res) => {
  const databaseHealthy = await checkDatabaseHealth();

  if (databaseHealthy) {
    return res.status(200).json({
      status: "UP",
      database: "UP"
    });
  }
  return res.status(503).json({
    status: "UP",
    database: "DOWN"
  })
});

app.get("/health/live", (req,res) => {
  res.status(200).json({
    status: "UP"
  });
});


app.use("/record", records);

// start the Express server
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
