#!/usr/bin/env bash
mkdir -p /home/vscode/.config/atcoder-cli-nodejs
cp -r golang /home/vscode/.config/atcoder-cli-nodejs/golang
acc config default-test-dirname-format test
acc config default-task-choice all
acc config default-template golang