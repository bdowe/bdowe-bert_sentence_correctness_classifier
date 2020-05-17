FROM pytorch/pytorch

WORKDIR /data
COPY requirements.txt /data/
RUN pip install --requirement requirements.txt
RUN rm -rf /root/.cache

EXPOSE 8888

CMD jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --allow-root
