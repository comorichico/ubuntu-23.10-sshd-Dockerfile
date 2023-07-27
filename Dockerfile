FROM ubuntu:23.10

RUN apt update && apt install -y openssh-server openjdk-22-jre nano screen sudo
RUN echo 'root:kokonipassword' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Create User
RUN useradd -m usernonamae
RUN echo 'usernonamae:kokonipassword' | chpasswd
RUN chsh -s /bin/bash usernonamae
RUN gpasswd -a usernonamae sudo

# ssh ポート開放
EXPOSE 22
# minecraft ポート開放
EXPOSE 25565

CMD ["/usr/sbin/sshd", "-D"]
