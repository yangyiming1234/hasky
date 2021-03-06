conf_path=./prepare/default/app-conf/ai-challenger/seq-basic-finetune
cp $conf_path/conf.py .
source $conf_path/config 

model_dir=/home/gezi/new/temp/image-caption/ai-challenger/model/showandtell.finetune
#assistant_model_dir=/home/gezi/new/temp/image-caption/ai-challenger/model/bow
assistant_model_dir=''
mkdir -p $model_dir

python ./train.py \
	--train_input $train_output_path/'train-*' \
  --valid_input $valid_output_path/'test-*' \
	--valid_resource_dir $valid_output_path \
	--vocab $dir/vocab.txt \
  --image_dir $win_image_dir \
  --label_file $valid_output_path/'image_label.npy' \
  --img2text $valid_output_path/'img2text.npy' \
  --text2id $valid_output_path/'text2id.npy' \
  --image_name_bin $valid_output_path/'image_names.npy' \
  --image_feature_bin $valid_output_path/'image_features.npy' \
  --num_records_file  $train_output_path/num_records.txt \
  --model_dir=$model_dir \
  --assistant_model_dir=$assistant_model_dir \
  --algo show_and_tell \
  --image_model InceptionResnetV2 \
  --image_checkpoint_file='/home/gezi/data/image_model_check_point/inception_resnet_v2_2016_08_30.ckpt' \
  --learning_rate 0.01 \
  --num_sampled 0 \
  --log_uniform_sample 1 \
  --fixed_eval_batch_size 10 \
  --num_fixed_evaluate_examples 2 \
  --num_evaluate_examples 10 \
  --show_eval 1 \
  --train_only 0 \
  --metric_eval 1 \
  --monitor_level 2 \
  --no_log 0 \
  --batch_size 32 \
  --num_gpus 0 \
  --eval_batch_size 200 \
  --min_after_dequeue 500 \
  --eval_interval_steps 500 \
  --metric_eval_interval_steps 2000 \
  --save_interval_steps 1000 \
  --save_interval_epochs 1 \
  --num_metric_eval_examples 100 \
  --metric_eval_batch_size 100 \
  --max_texts 20000 \
  --feed_dict 0 \
  --num_records 0 \
  --min_records 0 \
  --seg_method $online_seg_method \
  --feed_single $feed_single \
  --seq_decode_method greedy \
  --dynamic_batch_length 1 \
  --log_device 0 \
  --work_mode full \

  #--model_dir /home/gezi/data/image-text-sim/model/model.ckpt-387000 \
  #2> ./stderr.txt 1> ./stdout.txt
