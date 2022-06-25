FROM python:3.9-slim

RUN apt-get update && apt-get install -y gcc git

WORKDIR /workspace
COPY notebooks notebooks

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -U pip setuptools && \
    pip install --no-cache-dir -r requirements.txt

RUN git clone -b bugfix/infolm https://github.com/stancld/nlg_eval_via_simi_measures.git && \
    pip install --no-cache-dir --no-build-isolation -e nlg_eval_via_simi_measures/.
