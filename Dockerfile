


FROM gergo111/nvim-base



#install packages
RUN pacman -Sy --noconfirm --noprogressbar --needed archlinux-keyring \
	&& pacman-key --init \
	&& pacman-key --populate archlinux \
	&& pacman -Syu --noconfirm --noprogressbar --needed \
        dotnet-sdk-9.0 \
	&& pacman -Scc --noconfirm --noprogressbar --needed

RUN git clone https://aur.archlinux.org/netcoredbg.git /tmp/netcoredbg \
        && cd /tmp/netcoredbg \
        && makepkg --noconfirm --syncdeps --install

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
