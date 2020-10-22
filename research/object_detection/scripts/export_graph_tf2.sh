#!/bin/bash
INPUT_TYPE=image_tensor
PIPELINE_CONFIG_PATH=/opt/home/ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.config
TRAINED_CKPT_PREFIX=/opt/home/model_voc
EXPORT_DIR=/opt/home/
python3 ../exporter_main_v2.py \
    --input_type=${INPUT_TYPE} \
    --pipeline_config_path=${PIPELINE_CONFIG_PATH} \
    --trained_checkpoint_dir=${TRAINED_CKPT_PREFIX} \
    --output_directory=${EXPORT_DIR}

mkdir ${EXPORT_DIR}/saved_model/1 && cd ${EXPORT_DIR}/saved_model && mv assets saved_model.pb variables 1
