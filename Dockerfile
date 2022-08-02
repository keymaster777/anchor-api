FROM ruby:3.0.0

WORKDIR /app
COPY . /app
RUN bundle install

EXPOSE 4567

CMD ["/bin/bash"]
