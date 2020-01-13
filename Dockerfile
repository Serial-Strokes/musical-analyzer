# https://hub.docker.com/_/python
FROM python:3.8.1-buster

# https://packages.debian.org/buster/...
RUN apt-get update && \
    apt-get install -y \
    ffmpeg=7:4.1.* \
    gcc=4:8.3.* \
    gfortran=4:8.3.* \
    liblapack-dev=3.8.* \
    libopenblas-dev=0.3.* \
    llvm=1:7.* && \
    rm -rf /var/lib/apt/lists/*

# https://pypi.org/project/...
RUN pip install --no-cache-dir \
    "click==7.*" \
    "cython==0.29.*" \
    "librosa==0.7.*" \
    "numpy==1.18.*" \
    "pytest==5.3.*" \
    "scikit-learn==0.22.*" \
    "scipy==1.4.*" && \
    rm -rf /root/.cache

ARG username="musical-analyzer"
ARG userhome="/home/${username}"

RUN groupadd --system "${username}" && \
    useradd --create-home --gid "${username}" --no-log-init --system "${username}"

USER "${username}"
WORKDIR "${userhome}"

COPY src/ .

ENTRYPOINT [ "python", "./main.py" ]
