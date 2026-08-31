import { MongoClient, ServerApiVersion } from "mongodb";

const URI = process.env.ATLAS_URI || "";
const client = new MongoClient(URI, {
  serverApi: {
    version: ServerApiVersion.v1,
    strict: true,
    deprecationErrors: true,
  },
  appName: "devrel-github-javascript-mern",
});

let db;

export async function checkDatabaseHealth (){
  try {
    await client.db("admin").command({ping: 1});
    return true;
  } catch {
    return false;
  }
}

try {
  // Connect the client to the server
  await client.connect();
  // Send a ping to confirm a successful connection
  await client.db("admin").command({ ping: 1 });
  console.log("Pinged your deployment. You successfully connected to MongoDB!");
  db = client.db("employees");
} catch (err) {
  console.error(err);
}


export {db}
export default db;
