export MODEL_NAME="runwayml/stable-diffusion-v1-5"
accelerate launch --main_process_port 1234 --mixed_precision "bf16" --multi_gpu  llmga/diffusers/train_text_to_image.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir="./data" \
  --use_ema \
  --allow_tf32 \
  --resolution=512 --center_crop --random_flip \
  --train_batch_size=32 \
  --gradient_accumulation_steps=1 \
  --gradient_checkpointing \
  --max_train_steps=50000 \
  --learning_rate=1e-05 \
  --max_grad_norm=1 \
  --lr_scheduler="constant_with_warmup" \
  --lr_warmup_steps=1000 \
  --checkpointing_steps 2000 \
  --checkpoints_total_limit 2 \
  --lr_warmup_steps=0 \
  --output_dir="./work_dirs/llmga-sd15-t2i" \
