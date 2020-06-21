FROM ubuntu:trusty

COPY sources.list /etc/apt/
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y upgrade && \
    apt-get --no-install-recommends -y install \
	configure-debian \
	debconf-utils \
        iproute2 \
        jq \
        python3 \
        qemu-system-x86 \
        qemu-user-static \
        qemu-user \
        qemu \
	qemu-kvm \
	qemu-common \
        aptitude \
        nano \
        udhcpd \
        openssh-client \
        openssh-server \
        binfmt-support \
        dbus \
	usbutils \	
    && apt-get clean

RUN apt-get --no-install-recommends -y install libstdc++6:i386 \
        libgcc1:i386 sane-utils:i386

# COPY generate-dhcpd-conf /run/
# COPY qemu-ifdown /run/
# COPY qemu-ifup /run/

COPY run.sh /run/
COPY br*.deb /run/
RUN dpkg -i /run/br*.deb

EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
#VOLUME /image

#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/run/run.sh"]

# Mostly users will probably want to configure memory usage.
#CMD ["-m", "512M"]
CMD ["/bin/bash"]
