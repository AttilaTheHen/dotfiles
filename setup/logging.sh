#!/usr/bin/env bash

function success () {
    tput bold
    tput setaf 2  # green
    echo -n "[success] "
    tput sgr0
    echo $1
}

function info () {
    tput bold
    tput setaf 6  # cyan
    echo -n "[info] "
    tput sgr0
    echo $1
}

function warn() {
    tput bold
    tput setaf 3  # yellow
    echo -n "[warn] "
    tput sgr0
    echo $1
}

function error() {
    tput bold
    tput setaf 1  # red
    echo -n "[error] "
    tput sgr0
    echo $1
}
