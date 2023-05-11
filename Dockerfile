# Pull base image.
FROM nvcr.io/nvidia/tensorrt:22.07-py3

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y byobu curl git htop man unzip vim wget nano gedit python3-pip && \
  rm -rf /var/lib/apt/lists/*

# Add files.
# ADD root/.bashrc /root/.bashrc
# ADD root/.gitconfig /root/.gitconfig
# ADD root/.scripts /root/.scripts

RUN pip3 install --upgrade pip

# Install python packages
COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]