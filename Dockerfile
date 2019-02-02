FROM node:10

LABEL version="2.0.0"
LABEL repository="http://github.com/heowc/action-hexo"
LABEL homepage="https://heowc.github.io"
LABEL maintainer="heowc <heowc1992@gmail.com>"

LABEL com.github.actions.name="GitHub Action for hexo"
LABEL com.github.actions.description="Wraps the hexo CLI to enable common hexo commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"

RUN apt-get update && \
    apt-get install -y git-core

RUN npm install -g hexo

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]