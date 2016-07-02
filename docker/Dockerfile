FROM ruby:2.2
MAINTAINER Lanny

ENV REFRESH_AT=25_JUN_2016

RUN apt-get update && apt-get -y install curl wget

RUN gem source -r https://rubygems.org/ && gem source -a https://gems.ruby-china.org && gem update --system && gem update bundle && gem uninstall -aIx appium_lib && gem install --no-rdoc --no-ri appium_lib && gem install rspec && gem install cucumber

RUN mkdir -p /home/workspace/OneCucumber

WORKDIR /home/workspace/OneCucumber
