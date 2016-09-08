FROM base/archlinux

EXPOSE 8888

RUN pacman -Sy archlinux-keyring --noconfirm

RUN mkdir /workspace
RUN chmod 777 /workspace

RUN useradd -m -s /bin/bash -G wheel -p `perl -e 'print crypt("alas","salt")'` alas

WORKDIR /workspace
RUN pacman -S --noconfirm --needed base-devel sudo wget git expac jshon
RUN pacman-db-upgrade
#USER alas
#RUN mkdir packer
#WORKDIR /workspace/packer
#RUN wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer -OPKGBUILD
#RUN makepkg
#USER root
#RUN pacman -U --noconfirm `ls *.pkg*`

WORKDIR /workspace
RUN rm -rf *

RUN groupadd proc
RUN pacman -Sq --needed --noconfirm ca-certificates python-pip jupyter-notebook apache-ant jdk7-openjdk polkit openssh

USER alas
RUN git clone https://aur.archlinux.org/hadoop 
WORKDIR /workspace/hadoop
RUN makepkg
USER root
RUN pacman -U --noconfirm hadoop*.pkg*

WORKDIR /workspace
USER alas
RUN git clone https://aur.archlinux.org/apache-spark
WORKDIR /workspace/apache-spark
RUN makepkg
USER root
RUN pacman -U --noconfirm apache-spark*.pkg*

WORKDIR /workspace
RUN rm -rf *

RUN echo export SPARK_HOME=/opt/apache-spark >> /etc/profile
RUN export SPARK_HOME=/opt/apache-spark
COPY data/jupyter /workspace/jupyter

RUN jupyter kernelspec install /workspace/jupyter/kernels/pyspark
RUN mkdir -p $HOME/.ipython/profile_pyspark/startup/
RUN cp /workspace/jupyter/kernels/pyspark/00-pyspark-setup.py $HOME/.ipython/profile_pyspark/startup/

COPY spark-defaults.conf /etc/apache-spark
CMD jupyter notebook --ip 0.0.0.0
