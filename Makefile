NVIM_VERSION=nightly
# NVIM_VERSION=v0.11.4
NVIM_PLATFORM=linux
NVIM_ARCH=x86_64
NVIM_TAR=nvim-${NVIM_PLATFORM}-${NVIM_ARCH}-${NVIM_VERSION}.tar.gz
NVIM_URL=https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-${NVIM_PLATFORM}-${NVIM_ARCH}.tar.gz
OPT_DIR=neovim_test_config/opt
NVIM=$(OPT_DIR)/nvim-${NVIM_PLATFORM}-${NVIM_ARCH}/bin/nvim

.PHONY: all
all: docker

# Run Neovim inside Docker
.PHONY: docker
docker: $(NVIM)
	./run_docker.sh

# Extract Neovim if not already done
$(NVIM): $(OPT_DIR)/${NVIM_TAR}
	mkdir -p $(OPT_DIR)
	tar -xzf $(OPT_DIR)/${NVIM_TAR} -C $(OPT_DIR)
	touch $@

# Download Neovim tarball if not already present
$(OPT_DIR)/${NVIM_TAR}:
	mkdir -p $(OPT_DIR)
	curl -L $(NVIM_URL) -o $@
	touch $@

.PHONY: clean
clean:
	rm -rf $(OPT_DIR)/nvim-*
