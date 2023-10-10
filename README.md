# GAM-Depth
PyTorch implementation of our paper:

GAM-Depth: Self-Supervised Indoor Depth Estimation Leveraging a Gradient-Aware Mask and Semantic Constraints

Anqi Cheng, ZHiyuan Yang, Haiyue Zhu, Kezhi Mao

![Local Image](https://github.com/AnqiCheng1234/GAM-Depth/blob/master/assets/overall_pipeline.jpg)

![Local Image](https://github.com/AnqiCheng1234/GAM-Depth/blob/master/assets/1_new_1.jpg)

## Getting Started

### Installation

**Step1**: Creating a virtual environment

```bash
conda create -n gam_depth python=3.6
conda activate gam_depth
conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch -c conda-forge
```

**Step2**: Downloading [the modified scikit_image package](https://drive.google.com/file/d/15AMp8GO7QcK9SGQp6DJwNHtX29DRp5nG/view?usp=sharing) following [StructDepth](https://github.com/SJTU-ViSYS/StructDepth)

```bash
unzip scikit-image-0.17.2.zip
cd scikit-image-0.17.2
python setup.py build_ext -i
pip install -e .
``` 

**Step3**: Installing other packages

```bash
pip install -r requirements.txt
```

### Download pretrained model
Please download [pretrained models](https://drive.google.com/drive/folders/1ZMd-SxgWtztRlNq74LE5SBQLxnPsBuQC?usp=sharing) and unzip them to MODEL_PATH

### Inference single image
```python
python inference_single_image.py --image_path=/home/image_path --load_weights_folder=MODEL_PATH
```

## Evaluation

### Download test dataset
Please download [test datasets](https://drive.google.com/drive/folders/1F9sn6kL0NhU5ieTOmG8JqgFTbti_Uk_H?usp=sharing) of NYUv2, ScanNet, and InteriorNet and unzip them to VAL_PATH

### Evaluate NYUv2/InteriorNet/ScanNet depth
Modify the evaluation script in eval.sh to evaluate NYUv2/ScanNet/InteriorNet depth separately
```bash
python evaluation/nyuv2_eval_depth.py \
  --data_path VAL_PATH \
  --load_weights_folder MODEL_PATH \
```

## Trainning

### Download NYU V2 dataset
The raw NYU dataset is about 400G and has 590 videos. You can download the raw datasets from [there](http://horatio.cs.nyu.edu/mit/silberman/nyu_depth_v2/nyu_depth_v2_raw.zip)

### Download main directions and proxy semantic labels
Please download main directions with a random flip and proxy semantic labels from [there](https://drive.google.com/drive/folders/19BoAbiXwIwmIjzeQ8-KwgMfCD3lEjFb0?usp=sharing) and unzip them to VPS_PATH and SEG_PATH

Proxy semantic labels are generated from [Light-Weight RefineNet](https://github.com/DrSleep/light-weight-refinenet)

### Training
Modify the training script train.sh for PATH or different trainning settings.
```bash
python train.py \
  --data_path DATA_PATH \
  --val_path VAL_PATH \
  --vps_path VPS_PATH \
  --seg_path SEG_PATH \
  --log_dir ../logs/ \
  --model_name 1 \
  --batch_size 4 \
  --num_epochs 50 \
  --start_epoch 0 \
  --load_weights_folder MODEL_PATH/pretrain/ \
  --using_GAM GAM \
  --using_seg
```
## Acknowledgement
We borrowed a lot of codes from [scikit-image](https://github.com/scikit-image/scikit-image), [monodepth2](https://github.com/nianticlabs/monodepth2), [P<sup>2</sup>Net](https://github.com/svip-lab/Indoor-SfMLearner), [StructDepth](https://github.com/SJTU-ViSYS/StructDepth), [Light-Weight RefineNet](https://github.com/DrSleep/light-weight-refinenet), and [LEGO](https://github.com/zhenheny/LEGO). Thanks for their excellent works!
