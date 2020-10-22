#!/bin/bash
MODEL_DIR=/opt/home/saved_model/
tensorflow_model_server \
	--port=8500 \
	--rest_api_port=8501 \
	--model_name=saved_model \
	--model_base_path="${MODEL_DIR}" >server.log 2>&1
