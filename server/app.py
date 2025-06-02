from fastapi import FastAPI
from prometheus_client import start_http_server, Counter
import threading
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"]
)

REQUESTS = Counter("api_request_total", "Total API requests")

@app.get("/")
async def read_root():
    REQUESTS.inc()
    return {"status" : "ok"}


threading.Thread(target=start_http_server, args=(8000,), daemon=True).start()