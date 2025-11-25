


#build aur packages
FROM gergo111/nvim-base as builder

#system upgrade
RUN pacman -Sy --noconfirm --noprogressbar --needed archlinux-keyring \
	&& pacman -Syu --noconfirm --noprogressbar --needed

RUN useradd -m builduser && \
    echo "builduser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER builduser
RUN git clone https://aur.archlinux.org/netcoredbg.git /tmp/netcoredbg \
        && cd /tmp/netcoredbg \
        && makepkg --noconfirm --syncdeps



FROM gergo111/nvim-base

# copy aur package(s)
COPY --from=builder /tmp/netcoredbg/*.pkg.tar.* /tmp/

#install packages
RUN pacman -Sy --noconfirm --noprogressbar --needed archlinux-keyring \
	&& pacman-key --init \
	&& pacman-key --populate archlinux \
	&& pacman -Syu --noconfirm --noprogressbar --needed \
        dotnet-sdk-9.0 \
        && pacman -U --noconfirm --noprogressbar /tmp/*.pkg.tar.* \
	&& pacman -Scc --noconfirm --noprogressbar --needed


RUN dotnet tool install --global \
        csharp-ls



#copy nvim config
COPY .config /root/.config


#install plugins
RUN nvim +PlugInstall +qall

#install treesitter parsers
RUN nvim +TSUpdate +qall

#open nvim on startup
WORKDIR /root/src
CMD nvim +Ex
