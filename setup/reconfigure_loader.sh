#/usr/bin/bash

# The script is written in a way to keep idempotency

function i_install_go {
    cd /tmp && wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.2.linux-amd64.tar.gz 
    
    # TODO: idempotency??
    echo "export PATH=$PATH:/usr/local/go/bin" | tee -a $HOME/.bashrc
}

function ii_set_configs {
    cd /tmp && rm -rf experiment-toolset && git clone https://github.com/ProfilingServerless/experiment-toolset.git && cd experiment-toolset
    mv setup/configs/loader_config.json ~/loader/cmd/config.json
}

if command -v go &> /dev/null
then
    i_install_go
fi
ii_set_configs


echo "run 'source ~/.bashrc'"

