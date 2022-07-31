#!/bin/sh

redis-server &

export $(cat .env | xargs) && python hello.py