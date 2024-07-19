#!/bin/bash -x

SSH_ENV=$HOME/.ssh/environment

function start_agent {
  ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  # shellcheck disable=SC1090
  source "${SSH_ENV}" >/dev/null
}

if [ -z "$SSH_CONNECTION" ] && [ -z "$SSH_CLIENT" ]; then
  if [ -f "${SSH_ENV}" ]; then
    # shellcheck disable=SC1090
    source "${SSH_ENV}" >/dev/null
    ps -efp "${SSH_AGENT_PID}" | grep -q ssh-agent$ || {
        start_agent
    }
  else
    start_agent
  fi
fi