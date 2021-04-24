.PHONY = help setup test run clean environment

.DEFAULT_GOAL = setup

setup:
	@python train_cifar.py --epochs 120