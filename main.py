import os
import uvicorn
from server.app import app
from dotenv import load_dotenv

load_dotenv()

PORT = int(os.getenv("PORT", 8080))

def start_server():
    uvicorn.run(app, host="0.0.0.0", port=PORT)

if __name__ == "__main__":
    start_server()