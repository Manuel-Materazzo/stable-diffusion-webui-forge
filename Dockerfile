FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

WORKDIR /app

RUN apt update && apt upgrade -y
RUN apt install -y wget git python3 python3-venv libgl1 libglib2.0-0 apt-transport-https libgoogle-perftools-dev bc python3-pip

COPY . /app/sd-webui
RUN chmod +x /app/sd-webui/webui.sh

RUN useradd -m webui
RUN chown -R webui:webui /app
USER webui

RUN /app/sd-webui/webui.sh -i

ENTRYPOINT ["/app/sd-webui/webui.sh"]
