# Ultroid - UserBot
# Copyright (C) 2021-2022 TeamUltroid
# This file is a part of < https://github.com/Khatarteam/khteam >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM theteamultroid/khteam:main

# set timezone
ENV TZ=Africa/Cairo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    # cloning the repo and installing requirements.
    && git clone https://github.com/Khatarteam/khteam.git /root/Khatarteam/ \
    && pip3 install --no-cache-dir -r root/Khatarteam/requirements.txt \
    && pip3 install av --no-binary av

# changing workdir
WORKDIR /root/Khatarteam/

# start the bot
CMD ["bash", "startup"]
