FROM elasticsearch:5.3.2
MAINTAINER Ambar "http://ambar.cloud"

# Set a timezone
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY config ./config
COPY plugins/elasticsearch-analysis-ik-5.3.2.zip /elasticsearch-analysis-ik-5.3.2.zip

RUN bin/elasticsearch-plugin install http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/5.3.2/elasticsearch-analysis-morphology-5.3.2.zip
RUN bin/elasticsearch-plugin install analysis-stempel
RUN bin/elasticsearch-plugin install file:///elasticsearch-analysis-ik-5.3.2.zip

CMD ["elasticsearch"]