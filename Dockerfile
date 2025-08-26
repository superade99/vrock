FROM public.ecr.aws/deep-learning-containers/pytorch-training:2.6.0-gpu-py312-cu124-ubuntu22.04-sagemaker-v1.34

WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw

# Install HuggingFace + LLaMA dependencies
RUN pip install --no-cache-dir transformers accelerate safetensors

# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
