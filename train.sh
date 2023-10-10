echo training_1

python train.py \
  --data_path /home/data_path/ \
  --val_path /home/val_path/ \
  --vps_path /home/vps_path/ \
  --seg_path /home/seg_path/ \
  --log_dir ../logs/ \
  --model_name 1 \
  --batch_size 4 \
  --num_epochs 50 \
  --start_epoch 0 \
  --load_weights_folder /home/load_weights_folder/ \
  --using_GAM GAM \
  --using_seg
