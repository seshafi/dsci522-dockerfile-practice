FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# # Install mamba
# RUN conda install -c conda-forge mamba

# # Debugging: Check mamba installation
# RUN mamba --version && conda list && which mamba

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN mamba update --quiet --file /tmp/conda-linux-64.lock
RUN mamba clean --all -y -f
RUN fix-permissions "${CONDA_DIR}"
RUN fix-permissions "/home/${NB_USER}"
RUN echo "hello"