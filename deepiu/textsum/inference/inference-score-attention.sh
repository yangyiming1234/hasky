source ./config 

#--model_dir /home/gezi/temp/textsum/model.seq2seq.attention/ \
python ./inference/inference-score.py \
      --model_dir $1 \
      --seg_method $online_seg_method \
      --feed_single $feed_single 
