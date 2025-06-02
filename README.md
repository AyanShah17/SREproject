# SREproject 🚀

A containerized Python FastAPI web application designed for fast deployment and scalability. This project demonstrates best practices for building, running, and deploying lightweight web apps using Docker.

## Features
- Minimal FastAPI web server (`app.py`)
- Lightweight Docker container
- Easy to run locally or inside Docker
- Clean project structure

## Tech Stack
- **Python 3.11**

- **FastAPI** – Modern, fast (high-performance) web framework for building APIs with Python 3.6+

- **Docker** – Containerization

## Project Structure
- **SREproject**
```bash
- ├── app.py ( Main FastAPI application )
- ├── Dockerfile ( Instructions for Docker image )
- ├── requirements.txt ( Python package dependencies )
```

## Getting Started

### Running Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/AyanShah17/SREproject.git
   cd SREproject
   ```

#### Create a virtual environment (optional):

```bash
python -m venv venv
source venv/bin/activate 
```

#### On Windows: 

```bash
cd sreproject/venv/Scripts/
activate
```
or

```bash
cd sreproject
venv\Scripts\activate
```

#### Install dependencies:

```bash
pip install -r requirements.txt
```

#### Start the app with Uvicorn:

```bash 
uvicorn app:app --reload --host 0.0.0.0 --port 8000
```

#### Visit:

```bash
http://localhost:8000
```

### Running with Docker

#### Build the Docker image :

```bash 
docker build -t sreproject .
```

#### Run the container :

```bash 
docker run -p 8000:8000 sreproject
```
#### Open your browser at :

   ```bash 
   http://localhost:8000 
   ```

## Testing the App

Once running, the FastAPI app should respond at the root (/) route. 

#### You can test it using:
```bash
curl http://localhost:8000
```
#### Or visit it in your browser.

## Tips & Troubleshooting

Port Binding: Ensure the app runs on 0.0.0.0 so it’s reachable inside Docker (as shown in the Uvicorn command).

Memory Limits: Optimize dependencies and runtime if running in constrained environments.

Make sure you have uvicorn installed (pip install uvicorn).