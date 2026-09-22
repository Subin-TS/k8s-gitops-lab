from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return {
        "application": "k8s-gitops-lab",
        "message": "Hello from our DevOps application!",
        "version": "v2",
        "status": "running"
    }

@app.route("/health")
def health():
    return {
        "status": "healthy",
        "version": "v2"
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
