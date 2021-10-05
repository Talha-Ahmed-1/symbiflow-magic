SHELL := /bin/bash

all:
	wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda_installer.sh
	export INSTALL_DIR=~/opt/symbiflow
	export FPGA_FAM=xc7
	bash conda_installer.sh -u -b -p ~/opt/symbiflow/xc7/conda;
	source "~/opt/symbiflow/xc7/conda/etc/profile.d/conda.sh";
	wget --no-check-certificate --directory-prefix=xc7 --content-disposition https://raw.githubusercontent.com/SymbiFlow/symbiflow-examples/master/xc7/environment.yml
	wget --no-check-certificate --directory-prefix=xc7 --content-disposition https://raw.githubusercontent.com/SymbiFlow/symbiflow-examples/master/xc7/requirements.txt
	conda env create -f xc7/environment.yml
	mkdir -p ~/opt/symbiflow/xc7/install
	wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/367/20210822-000315/symbiflow-arch-defs-install-709cac78.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
	wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/367/20210822-000315/symbiflow-arch-defs-xc7a50t_test-709cac78.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
	wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/367/20210822-000315/symbiflow-arch-defs-xc7a100t_test-709cac78.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
	wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/367/20210822-000315/symbiflow-arch-defs-xc7a200t_test-709cac78.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
	wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/367/20210822-000315/symbiflow-arch-defs-xc7z010_test-709cac78.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
	export PATH=~/opt/symbiflow/xc7/install/bin:$PATH
	conda activate xc7
