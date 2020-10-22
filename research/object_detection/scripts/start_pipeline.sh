PIPELINE_CONFIG_PATH=/opt/home/ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.config
MODEL_DIR=/opt/home/model_voc
python3 ../model_main_tf2.py \
	--pipeline_config_path=${PIPELINE_CONFIG_PATH} \
	--model_dir=${MODEL_DIR} \
	--alsologtostderr
