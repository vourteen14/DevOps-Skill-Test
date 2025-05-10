FROM python:3.11 AS builder

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# update & upgrade dan install package yang dibutuhkan 
RUN apt update && apt upgrade -y
RUN apt install -y --no-install-recommends build-essential gcc libffi-dev libpq-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --prefix=/install -r requirements.txt

COPY . .

FROM python:3.11-slim

# buat user dan group devops menghindari penggunaan root user
RUN groupadd --system devops
RUN useradd --system --gid devops --create-home devops

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY --from=builder /install /usr/local
COPY --from=builder /app /app

WORKDIR /app

RUN chown -R devops:devops /app
USER devops

# expose port 5000 dan run menggunakan gunicorn agar support multi worker dan thread
EXPOSE 5000
CMD ["gunicorn", "main:app", "--bind=0.0.0.0:5000", "--workers=2", "--worker-class=gthread", "--threads=4", "--timeout=30", "--graceful-timeout=30", "--keep-alive=5", "--log-level=info"]