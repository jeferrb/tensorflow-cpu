Bootstrap: docker
From: nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

%environment

	#Environment variables

	#Use bash as default shell
	SHELL=/bin/bash

	#Add CUDA paths
	CPATH="/usr/local/cuda/include:$CPATH"
	PATH="/usr/local/cuda/bin:$PATH"
	LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
	CUDA_HOME="/usr/local/cuda"

	#Add Anaconda path
	PATH="/usr/local/anaconda3-4.2.0/bin:$PATH"

	export PATH LD_LIBRARY_PATH CPATH CUDA_HOME

%setup
	#Runs on host
	#The path to the image is $SINGULARITY_ROOTFS



%post
	#Post setup script

  #Load environment variables
	. /environment

	#Default mount paths
	mkdir /scratch /data /shared /fastdata


  #Updating and getting required packages
  apt-get update
  apt-get install -y wget git vim python python3

  #Creates a build directory
  mkdir build
  cd build

  #Download and install Anaconda
  CONDA_INSTALL_PATH="/usr/local/anaconda3-4.2.0"
  wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
  chmod +x Anaconda3-4.2.0-Linux-x86_64.sh
  ./Anaconda3-4.2.0-Linux-x86_64.sh -b -p $CONDA_INSTALL_PATH


  #Install Tensorflow CPU
  pip install tensorflow

	#Install Keras
	pip install --upgrade pip
	pip install --upgrade keras
	pip install --upgrade gensim
	pip install --upgrade dask
	pip install https://pypi.python.org/packages/source/n/nltk/nltk-3.2.1.tar.gz
	conda install nomkl numpy scipy scikit-learn numexpr matplotlib.pyplot ipython jupyter pandas sympy nose
	conda remove mkl mkl-service

%runscript
	#Executes with the singularity run command
	#delete this section to use existing docker ENTRYPOINT command


%test
	#Test that script is a success

	#Load environment variables
	. /environment

	#Test tensorflow install
	python -c "import tensorflow"
	python -c "import gensim"
