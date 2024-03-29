# Label noise vs Gaussian noise during the training of NNs

The code has been developed for the project of Princeton University's course COS598B in Spring 21' held by [Prof. Arora](https://www.cs.princeton.edu/~arora/).

The code is inspired to the one of the paper "Shape Matters: Understanding the Implicit Bias of the Noise Covariance". The original paper is [here](https://arxiv.org/abs/2006.08680). You find that code [here](https://github.com/jhaochenz/noise-implicit-bias)

## Experiments with VGG19, ResNet, and linear neural nets on Cifar10, MNIST, and synthetic data.

- The flag ``--net`` determines which model to use and take the following values ``vgg``, ``resnet``, ``dla``, ``densenet``, and ``linear``.

- The flag ``--dataset`` determines which model to use and take the following values ``cifar10``, ``MNIST``, and ``Synthetic linear``. The ``Synthetic linear`` is a regression dataset where the inputs are Gaussian random variables and the outputs are their forward pass throughtout a random linear net.

The flag ``--update_type`` determines which update to use: standard SGD, adding Gaussian noise, or adding label noise. The flag ``--label_noise`` determines the scale of the label noise that is added, and the flag ``--inner_lr`` determines the scale of Gaussian noise added.

Small batch baseline:

`python train_cifar.py --arch vgg19 --lr_sched vgg_default --update_type standard --lr 0.004 --iters 410550 --train_by_iters --batch_size 26 --iters_per_epoch 1173 --dataset cifar100 --weight_decay 0 --data_dir <PATH TO DATA>`

Large batch baseline:

`python train_cifar.py --arch vgg19 --lr_sched vgg_default --update_type standard --lr 0.004 --iters 410550 --train_by_iters --batch_size 256 --iters_per_epoch 1173 --dataset cifar100 --weight_decay 0 --data_dir <PATH TO DATA>`

To run with label noise:

`python train_cifar.py --arch vgg19 --lr_sched vgg_default --update_type mean_zero_label_noise --lr 0.004 --iters 410550 --train_by_iters --batch_size 256 --iters_per_epoch 1173 --dataset cifar100 --label_noise 0.1 --ln_sched vgg_default --ln_decay 0.5 --also_flip_labels --weight_decay 0 --data_dir <PATH TO DATA>`

To run with Gaussian noise with sigma = 7.5e-5:

`python train_cifar.py --arch vgg19 --lr_sched vgg_default --update_type gaussian_drift --lr 0.004 --iters 410550 --train_by_iters --batch_size 256 --iters_per_epoch 1173 --dataset cifar100 --inner_lr 0.000075 --inner_anneal vgg_default --weight_decay 0 --data_dir <PATH TO DATA>`

